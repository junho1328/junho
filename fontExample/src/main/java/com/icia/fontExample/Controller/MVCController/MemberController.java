package com.icia.fontExample.Controller.MVCController;

import java.util.*;

import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class MemberController {
	@GetMapping("/join")
	public String join(Model model) {
		model.addAttribute("viewName", "member/join.jsp");
		return "main";
	}
	@GetMapping("/login")
	public String login(Model model) {
		model.addAttribute("viewName", "member/login.jsp");
		return "main";
	}
	@GetMapping("/changePwd")
	public String changePwd(Model model) {
		model.addAttribute("viewName", "member/changePwd.jsp");
		return "main";
	}
	@GetMapping("/findId")
	public String findId(Model model) {
		model.addAttribute("viewName", "member/findId.jsp");
		return "main";
	}
	@Secured("ROLE_MEMBER")
	@GetMapping("/withdrawal")
	public String withdrawal(Model model) {
		model.addAttribute("viewName", "member/withdrawal.jsp");
		return "main";
	}
	@RequestMapping("/myInfomation")
	public String myInfomation(Model model) {
		model.addAttribute("viewName", "member/myInfomation.jsp");
		return "main";
	}
	@GetMapping("/notLoginChangePwd")
	public String notLoginChangePwd(Model model) {
		model.addAttribute("viewName", "member/notLoginChangePwd.jsp");
		return "main";
	}
	@GetMapping("/favorites")
	public String favorites(Model model) {
		model.addAttribute("viewName", "member/favorites.jsp");
		return "main";
	}
	@Secured("ROLE_MEMBER")
	@GetMapping("/salesRights")
	public String SalesRights(Model model) {
		model.addAttribute("viewName","member/SalesRights.jsp");
		return "main";
	}
	@RequestMapping("/myinquiry")
	public String 	myinquiry(Model model) {
		model.addAttribute("viewName", "member/myinquiry.jsp");
		return "main";
	}
	@RequestMapping(value = "/talk", method = RequestMethod.GET)
	public String talk(Locale locale, Model model) {
		model.addAttribute("viewName", "site/talk.jsp");
		return "main";
	}

}
