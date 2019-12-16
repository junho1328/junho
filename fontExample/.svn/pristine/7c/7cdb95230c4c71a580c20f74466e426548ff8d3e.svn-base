package com.icia.fontExample.Controller;

import javax.validation.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;

import com.icia.fontExample.Service.*;

@RequestMapping("/api")
@RestController
public class RelatedProductsController {
	@Autowired
	private RelatedProductsService service;
	
	@GetMapping("/relatedProducts")
	@ResponseBody
	public ResponseEntity<?> findRelatedProducts(@RequestParam(defaultValue = "0") long no) {
			return ResponseEntity.ok(service.findRelatedProducts(no));			
	}
}