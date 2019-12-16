package com.icia.fontExample.util;

import javax.servlet.http.*;

import org.springframework.web.client.*;

public class VisitListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		String url = "http://localhost:8081/fontExample/api/statistics/visit";
		RestTemplate tpl = new RestTemplate();
		tpl.postForObject(url, null,Integer.class);
		session.setAttribute("showList", "Square");
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
	}

}
