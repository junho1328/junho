package com.icia.fontExample.Controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.icia.fontExample.Service.*;


@RestController
public class MyReviewController {
	@Autowired
	private MyReviewService service;
	
//	@Secured("ROLE_USER")
	@GetMapping("/myReviews")
	public ResponseEntity<?> findAllReviewByUsername(@RequestParam(defaultValue="1") int pageno) {
		return ResponseEntity.ok(service.findAllReviewByUsername(pageno));
	}
	
}
