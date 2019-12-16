package com.icia.fontExample.Controller.MVCController;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class SiteController {
	@RequestMapping("/")
	public String main(Model model) {
		model.addAttribute("viewName", "test/main.jsp");
		return "main";
	}
	@GetMapping("/service_center_menu")
	public String serviceCenterMenu(Model model) {
		model.addAttribute("viewName", "site/service_center_menu.jsp");
		return "main";
	}
	@GetMapping("/notice")
	public String notice(Model model) {
		model.addAttribute("viewName", "site/notice.jsp");
		return "main";
	}
	@GetMapping("/notice_enrollment")
	public String notice_enrollment(Model model) {
		model.addAttribute("viewName", "site/notice_enrollment.jsp");
		return "main";
	}
	@GetMapping("/notice_reWrite")
	public String notice_reWrite(Model model) {
		model.addAttribute("viewName", "site/notice_reWrite.jsp");
		return "main";
	}
	@GetMapping("/notice_read")
	public String notice_read(Model model) {
		model.addAttribute("viewName", "site/notice_read.jsp");
		return "main";
	}
	@GetMapping("/inquiry_write")
	public String inquiry_write(Model model) {
		model.addAttribute("viewName", "site/inquiry_write.jsp");
		return "main";
	}
	@GetMapping("/inquiry_read")
	public String inquiry_read(Model model) {
		model.addAttribute("viewName", "site/inquiry_read.jsp");
		return "main";
	}
	@GetMapping("/declaration")
	public String declaration(Model model) {
		model.addAttribute("viewName", "site/declaration.jsp");
		return "main";
	}
	@RequestMapping("/certification")
	public String certification(Model model) {
		return "site/certification";
	}

}
