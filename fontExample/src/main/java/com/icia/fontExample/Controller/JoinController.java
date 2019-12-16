package com.icia.fontExample.Controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.prepost.*;
import org.springframework.web.bind.annotation.*;

import com.icia.fontExample.Service.*;

@CrossOrigin(origins="*")
@RestController
public class JoinController {
	@Autowired
	private JoinService service;
	
	@GetMapping("/checkId/{username}")
	public ResponseEntity<?> checkId(@PathVariable String username) {
		boolean result = service.checkId(username);
		if(result==true)
			return ResponseEntity.ok(null);
		return ResponseEntity.status(HttpStatus.CONFLICT).body(null);
	}
	
	@GetMapping(path="/checkEmail", produces="text/plain;charset=utf-8")
	public ResponseEntity<?> checkEmail(String email) {
		boolean result = service.checkEmail(email);
		if(result==true)
			return ResponseEntity.ok(null);
		return ResponseEntity.status(HttpStatus.CONFLICT).body(null);
	}
}
