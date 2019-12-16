package com.icia.fontExample.Controller.MVCController;

import org.springframework.security.access.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Secured("ROLE_MEMBER")
@Controller
public class PointController {
	@GetMapping("/charge")
	public String charge(Model model) {
		model.addAttribute("viewName", "point/charge.jsp");
		return "main";
	}
	@GetMapping("/chargeError")
	public String chargeError(Model model) {
		model.addAttribute("viewName", "point/chargeError.jsp");
		return "main";
	}
	@GetMapping("/exchangepage")
	public String exchangepage(Model model) {
		model.addAttribute("viewName", "point/exchangepage.jsp");
		return "main";
	}
	@GetMapping("/chargeInfo")
	public String chargeInfo(Model model) {
		model.addAttribute("viewName", "point/chargeInfo.jsp");
		return "main";
	}
	@GetMapping("/paysample")
	public String paysample(Model model) {
		model.addAttribute("viewName", "point/paymentsample.jsp");
		return "main";
	}
	@GetMapping("/payment")
	public String payment(Model model) {
		model.addAttribute("viewName", "point/paymentList.jsp");
		return "main";
	}
}
