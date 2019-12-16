package com.icia.fontExample.Controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.icia.fontExample.Service.*;

@RestController
public class SellerRestController {
	@Autowired
	private SellerService service;

	@GetMapping("/findseller")
	public ResponseEntity<?> findSeller(@RequestParam String username){
		System.out.println(username);
		return ResponseEntity.ok(service.findSeller(username));
	}
	
	@GetMapping("/findsellerAll")
	public ResponseEntity<?> findSellerAll(@RequestParam String username){
		System.out.println(username);
		return ResponseEntity.ok(service.findSellerAll(username));
	}
	
}
