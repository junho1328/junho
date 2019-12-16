package com.icia.fontExample.Controller;

import java.io.*;


import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.icia.fontExample.Service.*;
import com.icia.fontExample.entity.*;

@Secured("ROLE_MEMBER")
@RestController
public class SalesRightsController {
	@Autowired
	private SalesRightsService service;
	@PostMapping("/salesRights")
	public ResponseEntity<?> insert(@ModelAttribute Seller seller ,  MultipartFile storeSajin) throws IllegalStateException, IOException{
		System.out.println(seller);
		return ResponseEntity.ok(service.insert(seller, storeSajin));
	}
	@GetMapping("/checkName/{name}")
	public ResponseEntity<?> checkName(@PathVariable String name) {
		boolean result = service.checkName(name);
		if(result==true)
			return ResponseEntity.ok(null);
		return ResponseEntity.status(HttpStatus.CONFLICT).body(null);
	}
	@GetMapping("/checkSns/{sns}")
	public ResponseEntity<?> checkSns(@PathVariable String sns) {
		boolean result = service.checkSns(sns);
		if(result==true)
			return ResponseEntity.ok(null);
		return ResponseEntity.status(HttpStatus.CONFLICT).body(null);
	}
	@GetMapping("/checkAccount/{account}")
	public ResponseEntity<?> checkAccount(@PathVariable String account) {
		boolean result = service.checkAccount(account);
		if(result==true)
			return ResponseEntity.ok(null);
		return ResponseEntity.status(HttpStatus.CONFLICT).body(null);
	}
	
}
