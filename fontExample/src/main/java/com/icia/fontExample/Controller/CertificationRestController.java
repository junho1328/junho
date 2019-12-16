package com.icia.fontExample.Controller;

import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.icia.fontExample.Service.*;

import lombok.*;

@RequestMapping("/api")
@CrossOrigin("*")
@RestController
public class CertificationRestController {
	@Autowired
	private CertificationService service;
	
	@GetMapping(path="/certification_find")
	public ResponseEntity<?> certification_find(@NonNull String username) {
		return ResponseEntity.ok(service.certification_find(username));
	}
	
	@PostMapping(path="/email_Certification", produces="text/plain;charset=utf-8")
	public ResponseEntity<?> email_Certification(@NonNull String username) {
		return ResponseEntity.ok(service.email_Certification(username));
	}
	
	@PostMapping(path="/tel_Certification", produces="text/plain;charset=utf-8")
	public ResponseEntity<?> tel_Certification(@NonNull String username) {
		return ResponseEntity.ok(service.tel_Certification(username));
	}
	
}
