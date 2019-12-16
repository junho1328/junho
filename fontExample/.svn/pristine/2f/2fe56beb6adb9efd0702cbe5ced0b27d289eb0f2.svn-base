package com.icia.fontExample.Controller.MVCController;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class ReviewController {
	@GetMapping("/myReview")
	public String myreview(Model model) {
		model.addAttribute("viewName", "review/myReview.jsp");
		return "main";
	}
	@GetMapping("/sellReviewReport")
	public String sellReviewReport(Model model, String username, String productName) {
		model.addAttribute("viewName", "review/sellReviewReport.jsp");
		model.addAttribute("username", username);
		model.addAttribute("productName", productName);
		return "main";
	}
	@RequestMapping("/sellReviewPage")
	public String sellReviewPage(Model model) {
		model.addAttribute("viewName", "review/sellReviewPage.jsp");
		return "main";
	}

}
