package com.icia.fontExample.Controller.MVCController;

import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class TradeController {
	@GetMapping("/cachecheck")
	public String cachecheck(Model model) {
		model.addAttribute("viewName", "trade/cachecheck.jsp");
		return "main";
	}
	@GetMapping("/purchaseok")
	public String purchaseokjsp(Model model) {
		model.addAttribute("viewName", "trade/purchaseok.jsp");
		return "main";
	}
	@RequestMapping("/transaction")
	public String transaction(Model model) {
		model.addAttribute("viewName", "trade/transaction.jsp");
		return "main";
	}
	@GetMapping("/buy_waiting")
	public String buy_waiting(Model model) {
		model.addAttribute("viewName", "trade/buy_waiting.jsp");
		return "main";
	}
	@GetMapping("sell_waiting")
	public String sell_waiting(Model model) {
		model.addAttribute("viewName", "trade/sell_waiting.jsp");
		return "main";
	}
	@GetMapping("/buy_history")
	public String buy_history(Model model) {
		model.addAttribute("viewName", "trade/buy_history.jsp");
		return "main";
	}
	@GetMapping("/sell_history")
	public String sell_history(Model model) {
		model.addAttribute("viewName", "trade/sell_history.jsp");
		return "main";
	}
}
