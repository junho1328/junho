package com.icia.fontExample.Controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.icia.fontExample.Service.*;

@RequestMapping("/api")
@RestController
public class CategoryRestController {
	@Autowired
	private CategoryService service;
	
	@GetMapping("/categories/large")
	public ResponseEntity<?> findAllLargeCategory() {
		return ResponseEntity.ok(service.findAllLargeCategory());
	}
	
	@GetMapping("/categories/small")
	public ResponseEntity<?> findAllSmallCategory() {
		return ResponseEntity.ok(service.findAllSmallCategory());
	}
	
	@GetMapping("/categories/small/{lno}")
	public ResponseEntity<?> findSmallCategoryByLno(@PathVariable long lno){
		return ResponseEntity.ok(service.findSmallCategoryByLno(lno));
	}
	
	@GetMapping("/categories/tag")
	public ResponseEntity<?> findAllTag() {
		return ResponseEntity.ok(service.findAllTag());
	}
}
