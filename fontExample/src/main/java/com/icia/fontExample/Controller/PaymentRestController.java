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
public class PaymentRestController {
	@Autowired
	private PaymentService service;

	@PostMapping("/payment/complete")
	public ResponseEntity<?> paycomplete(String imp_uid,long amount,Principal principal) throws JsonParseException, JsonMappingException, IOException{
		return ResponseEntity.ok(service.paymentCheck(imp_uid,amount,principal.getName()));
	}
	@PostMapping(path="/payment/check/{no}",produces="text/plain;charset=utf-8")
	public ResponseEntity<?> paycheck(@PathVariable long no) throws JsonParseException, JsonMappingException, IOException{
		return ResponseEntity.ok(service.paidCheck(no));
	}
	@GetMapping("/payment")
	public ResponseEntity<?> paymentByAdmin(@RequestParam(defaultValue = "1")int pageno,@RequestParam(defaultValue = "10")int pagesize){
		return ResponseEntity.ok(service.findAllByPage(pageno, pagesize));
	}
	@GetMapping("/payment/user")
	public ResponseEntity<?> paymentByUser(@RequestParam(defaultValue = "1")int pageno,@RequestParam(defaultValue = "10")int pagesize,Principal principal){
		return ResponseEntity.ok(service.findAllByPageByUsername(pageno, pagesize, principal.getName()));
	}
	@PostMapping("/payment/cancel/{no}")
	public ResponseEntity<?> paycancel(@PathVariable long no) throws JsonParseException, JsonMappingException, IOException{
		return ResponseEntity.ok(service.paymentCancel(no));
	}
	@PostMapping("/point/up")
	public ResponseEntity<?> increasePoint(String username,@RequestParam long point){
		service.increasePoint(username, point);
		return ResponseEntity.ok(service.findPointByUsername(username));
	}
	@PostMapping("/point/down")
	public ResponseEntity<?> decreasePoint(String username,@RequestParam long point){
		service.decreasePoint(username, point);
		return ResponseEntity.ok(service.findPointByUsername(username));
	}
	@GetMapping("/point")
	public ResponseEntity<?> findPointByUsername(Principal principal){
		return ResponseEntity.ok(service.findPointByUsername(principal.getName()));
	}
	
	@PostMapping("/point/waiting")
	public ResponseEntity<?> waitingPoint(Principal principal,@RequestParam long no, @RequestParam long point,@RequestParam String sellerUsername){
		return ResponseEntity.ok(service.waitingPoint(principal.getName(),no , point, sellerUsername));
	}
	@PostMapping(path="/checkfinalPayment", produces="text/plain;charset=utf-8")
	public ResponseEntity<?> checkFinalPayment(Principal principal,@RequestParam String finalPayment){
		return ResponseEntity.ok(service.checkFinalPayment(principal.getName(), finalPayment));
	}
}
