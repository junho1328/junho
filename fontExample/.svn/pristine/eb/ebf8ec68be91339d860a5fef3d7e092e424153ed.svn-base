package com.icia.fontExample.Controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.web.bind.annotation.*;

import com.icia.fontExample.Service.*;
import com.icia.fontExample.entity.*;

@CrossOrigin("*")
@RequestMapping("/api")
@RestController
public class DeclarationController {
	@Autowired
	private DeclarationService service;
	@Secured("ROLE_MEMBER")
	@PostMapping("/declaration")
	public ResponseEntity<?> insert(Declaration declaration){
		return ResponseEntity.ok(service.insert(declaration));
	}
	@Secured("ROLE_ADMIN")
	@GetMapping("/declaration/pageno")
	public ResponseEntity<?> findByPageNo(@RequestParam(defaultValue ="1")int pageno,@RequestParam(defaultValue = "10")int pagesize){
		System.out.println("gdgd");
		return ResponseEntity.ok(service.findByPage(pageno, pagesize));
	}
	@Secured("ROLE_ADMIN")
	@GetMapping("/declaration/detailView")
	public ResponseEntity<?> detatilView(@RequestParam long no){
		return ResponseEntity.ok(service.detailView(no));
	}
}
