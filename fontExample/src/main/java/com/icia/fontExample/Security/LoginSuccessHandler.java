package com.icia.fontExample.Security;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.security.core.*;
import org.springframework.security.web.*;
import org.springframework.security.web.authentication.*;
import org.springframework.security.web.savedrequest.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;

@Component("loginSuccessHandler")
public class LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
	@Autowired
	private LoginDao loginDao;

	// �궗�슜�옄媛� 媛� 紐⑹쟻吏�瑜� ���옣�븯�뒗 �겢�옒�뒪
	// �듅蹂꾪븳 紐⑹쟻吏�媛� �뾾�떎硫� /濡� 蹂대궡硫� �맂�떎
	private RequestCache cache = new HttpSessionRequestCache();

	// redirect瑜� �떞�떦�븯�뒗 媛앹껜. �뒪�봽留� 而⑦듃濡ㅻ윭媛� �븘�땲誘�濡� return "redirect:/" �궗�슜 遺덇�
	private RedirectStrategy rs = new DefaultRedirectStrategy();

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		System.out.println("�꽦怨�");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username + password);
		
		HttpSession session = request.getSession();
		System.out.println("�꽦怨�1");
		
		// 濡쒓렇�씤 �꽦怨듯븯硫� �떎�뙣�슏�닔 珥덇린�솕, 濡쒓렇�씤 �슏�닔 利앷�
		loginDao.resetLoginFailureCount(username);
		SavedRequest savedRequest = cache.getRequest(request, response);

		// 濡쒓렇�씤 �꽦怨� �썑 �씠�룞�븷 �럹�씠吏�媛� �엳�쓣 寃쎌슦 �꽭�뀡�뿉 ���옣
		if (savedRequest != null)
			session.setAttribute("dest", savedRequest.getRedirectUrl());

		// 臾댁“嫄� 猷⑦듃濡� �씠�룞. �씠�룞�븷 �럹�씠吏�媛� �엳�쓣 寃쎌슦�룄 猷⑦듃瑜� 嫄곗퀜 �씠�룞
		rs.sendRedirect(request, response, "/");
		
	}
}