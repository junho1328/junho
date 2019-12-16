package com.icia.fontExample.Controller.MVCController;

import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Secured("ROLE_ADMIN")
@Controller
public class ManagementController {
	@GetMapping("/sellManagement2")
	public String sellManagement(Model model) {
		model.addAttribute("viewName", "management/sellManagement.jsp");
		return "main";
	}
	@GetMapping("/blockManagement")
	public String blockManagement(Model model) {
		model.addAttribute("viewName", "management/blockManagement.jsp");
		return "main";
	}
	@GetMapping("/membermanagement")
	public String membermanagement(Model model) {
		model.addAttribute("viewName", "management/membermanagement.jsp");
		return "main";
	}
	@GetMapping("/sales")
	public String sales(Model model) {
		model.addAttribute("viewName", "management/sales.jsp");
		return "main";
	}
	@GetMapping("/declarationList")
	public String declarationList(Model model) {
		model.addAttribute("viewName", "management/declarationList.jsp");
		return "main";
	}
	@Secured("ROLE_MEMBER")
	@GetMapping("/declaration/detailView")
	public String declarationdatailView(Model model) {
		model.addAttribute("viewName","management/DeclarationDetail.jsp");
		return "main";
	}
	@GetMapping("/exchangemanager")
	public String exchangemanager(Model model) {
		model.addAttribute("viewName", "management/exchangemanager.jsp");
		return "main";
	}
	@GetMapping("/inquiry")
	public String inquiry(Model model) {
		model.addAttribute("viewName", "management/inquiry.jsp");
		return "main";
	}
	@GetMapping("/managementpage")
	public String managementpage(Model model) {
		model.addAttribute("viewName", "management/managementpage.jsp");
		return "main";
	}
	@GetMapping("/product_inquiry")
	public String product_inquiry(Model model) {
		model.addAttribute("viewName", "management/product_inquiry.jsp");
		return "main";
	}
	@GetMapping("/inquiryAnswer")
	public String inquiryAnswer(Model model) {
		model.addAttribute("viewName", "management/inquiryAnswer.jsp");
		return "main";
	}
	
}