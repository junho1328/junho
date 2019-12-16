package com.icia.fontExample.Controller.MVCController;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class BoardController {
	@GetMapping("/productList")
	public String productListBar(Model model,String Search,String category) {
		model.addAttribute("viewName", "board/productList.jsp");
		model.addAttribute("Search", Search);
		model.addAttribute("category", category);
		return "main";
	}
	
	@GetMapping("/category")
	public String category(Model model) {
		model.addAttribute("viewName", "board/category.jsp");
		return "main";
	}
}
