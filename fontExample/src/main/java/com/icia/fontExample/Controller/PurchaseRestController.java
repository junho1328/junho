package com.icia.fontExample.Controller;

import java.io.*;
import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.*;

import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.databind.*;
import com.icia.fontExample.Dto.*;
import com.icia.fontExample.Service.*;

@RequestMapping("/api")
@CrossOrigin("*")
@RestController
public class PurchaseRestController {
	@Autowired
	private PurchaseService service;

	@PostMapping("/purchase/insert")
	public ResponseEntity<?> insertPurchase(Principal principal,@RequestParam long no,@RequestParam int quantity){
		return ResponseEntity.ok(service.insertPurchase(principal.getName(),no,quantity));
	}
	@PostMapping("/purchase/findPurchaseNo")
	public ResponseEntity<?> findPurchaseNo(Principal principal,@RequestParam long no){
		return ResponseEntity.ok(service.findPurchaseNo(principal.getName(),no));
	}
	@PostMapping("/purchase/complete")
	public ResponseEntity<?> purchaseComplete(long no){
		return ResponseEntity.ok(service.purchaseComplete(no));
	}
	@GetMapping("/purchase/waiting/buyer")
	public ResponseEntity<?> findPurchaseBuyer(Principal principal,@RequestParam(defaultValue = "1")int pageno,@RequestParam(defaultValue = "5")int pagesize){
		return ResponseEntity.ok(service.findPurchaseBuyer(principal.getName(), pageno, pagesize));
	}
	@GetMapping("/purchase/waiting/seller")
	public ResponseEntity<?> findPurchaseSeller(Principal principal,@RequestParam(defaultValue = "1")int pageno,@RequestParam(defaultValue = "5")int pagesize){
		return ResponseEntity.ok(service.findPurchaseSeller(principal.getName(), pageno, pagesize));
	}
	@PutMapping("/purchase/sell/ok")
	public ResponseEntity<?> updateState(@RequestParam long no){
		return ResponseEntity.ok(service.updateState(no));
	}
}
