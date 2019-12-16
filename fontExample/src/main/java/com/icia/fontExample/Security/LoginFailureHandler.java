package com.icia.fontExample.Security;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.authentication.*;
import org.springframework.security.core.*;
import org.springframework.security.web.*;
import org.springframework.security.web.authentication.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;

@Component("loginFailureHandler")
public class LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler {
	@Autowired
	private LoginDao loginDao;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException e) throws IOException, ServletException {
		// �씤利앹뿉 �떎�뙣�븯硫� AuthenticationException�씠 諛쒖깮
		// �씠 �삁�쇅媛� BadCredentialException - 鍮꾨�踰덊샇 ��由�
		// �씠 �삁�쇅媛� InternalAuthenticationException - �븘�씠�뵒 �뾾�쓬
		//		Principal, UserDetailsService �옉�꽦�씠 �븘�슂
		// �씠 �삁�쇅媛� DisabledException - 怨꾩젙 李⑤떒
		HttpSession session = request.getSession();
		if(e instanceof BadCredentialsException) {
			String username = request.getParameter("username");
			// �씠 if臾몄뿉�꽌 �븘�씠�뵒瑜� 李얠쓣 �닔 �뾾�뒗 寃쎌슦�� 鍮꾨�踰덊샇媛� ��由� 寃쎌슦瑜� 泥섎━
			String count = loginDao.findLoginFailureCount(username);
			// 鍮꾨�踰덊샇媛� ��由� 寃쎌슦 濡쒓렇�씤 �떎�뙣 �슏�닔瑜� �씫�뼱�삩�떎
			// �븘�씠�뵒媛� 議댁옱�븯吏� �븡�뒗 寃쎌슦 寃��깋�씠 �떎�뙣�븯湲� �븣臾몄뿉 濡쒓렇�씤 �떎�뙣 �슏�닔媛� null�씠 �맂�떎
			if(count==null) {
				session.setAttribute("msg", "�븘�씠�뵒�굹 鍮꾨�踰덊샇瑜� �솗�씤�븯�꽭�슂");
			}
			else {
				Integer loginFailureCount = Integer.parseInt(count);
				if(loginFailureCount<4) {
					// 濡쒓렇�씤�뿉 3�쉶�씠�븯濡� �떎�뙣�븳 寃쎌슦
					loginDao.increaseLoginFailureCount(username);
					session.setAttribute("msg", (loginFailureCount + 1) + "�쉶 濡쒓렇�씤�뿉 �떎�뙣�뻽�뒿�땲�떎");
				}
				else if(loginFailureCount >= 4 && loginFailureCount <= 9) {
					// 濡쒓렇�씤�뿉 4�쉶 �떎�뙣�븳 寃쎌슦. �떎�뙣�슏�닔 利앷��떆�궎怨� 怨꾩젙 釉붾줉
					loginDao.increaseLoginFailureCount(username);
					session.setAttribute("captcha", "captcha");
					session.setAttribute("msg", (loginFailureCount + 1) + "�쉶 濡쒓렇�씤�뿉 �떎�뙣�뻽�뒿�땲�떎");
				}
				else if(loginFailureCount > 9) {
					loginDao.block(username);
					session.setAttribute("msg", "10�쉶�씠�긽 �떎�뙣�빐 怨꾩젙�씠 李⑤떒�릺�뿀�뒿�땲�떎");
				}
			}
			
		} else if(e instanceof DisabledException) {
			// enabled媛� 0�씤 寃쎌슦 濡쒓렇�씤�뿉 �떎�뙣�븯硫댁꽌 �뿬湲곌� �떎�뻾�맂�떎
			session.setAttribute("msg", "10�쉶�씠�긽 �떎�뙣�빐 李⑤떒�맂 怨꾩젙�엯�땲�떎");
		}
		
		// redirect瑜� �떞�떦�븯�뒗 媛앹껜. �뒪�봽留� 而⑦듃濡ㅻ윭媛� �븘�땲誘�濡� return "redirect:/" �궗�슜 遺덇�
		new DefaultRedirectStrategy().sendRedirect(request, response, "/login");
	}
}
