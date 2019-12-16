package com.icia.fontExample.Controller.MVCController;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class PolicyController {
	@GetMapping("/termsOfUse")
	public String termsOfUse(Model model) {
		return "policy/termsOfUse";
	}
	@GetMapping("/privacyPolicy")
	public String privacyPolicy(Model model) {
		return "policy/privacyPolicy";
	}
	@GetMapping("/business")
	public String business(Model model) {
		return "policy/business";
	}
	@GetMapping("/operationPolicy")
	public String operationPolicy(Model model) {
		return "policy/operationPolicy";
	}
	@GetMapping("/privacy")
	public String privacy(Model model) {
		return "policy/privacy";
	}
	@GetMapping("/uniqueIdentification")
	public String uniqueIdentification(Model model) {
		return "policy/uniqueIdentification";
	}
	@GetMapping("/newsAgency")
	public String newsAgency(Model model) {
		return "policy/newsAgency";
	}
	@GetMapping("/serviceview")
	public String serviceview(Model model) {
		return "policy/serviceview";
	}
}
