package com.icia.fontExample.Controller.MVCController;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class ProductController {
	@GetMapping("/uploadProduct")
	public String uploadProduct(Model model) {
		model.addAttribute("viewName", "product/uploadProduct.jsp");
		return "main";
	}
	@GetMapping("/readProduct")
	public String readProduct(Model model) {
		model.addAttribute("viewName", "product/readProduct.jsp");
		return "main";
	}
	@GetMapping("/sellerpopup")
	public String sellerPopup(Model model) {
		model.addAttribute("viewName", "member/sellerpopup.jsp");
		return "popup";
	}
}
