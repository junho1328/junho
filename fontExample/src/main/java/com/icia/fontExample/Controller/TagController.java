package com.icia.fontExample.Controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.icia.fontExample.Service.*;

@RequestMapping("/api")
@RestController
public class TagController {
	@Autowired
	private TagService service;
	
	@GetMapping("/findHotTag")
	public ResponseEntity<?> findHotTag() {
		return ResponseEntity.ok(service.findHotTag());
	}
}
