package com.icia.fontExample.Controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.icia.fontExample.Service.*;

@RequestMapping("/api")
@RestController
public class ReadSellerReviewController {
	@Autowired
	private ReadSellerReviewService service;
	
//	@Secured("ROLE_USER")
	@GetMapping("/sellerReviews")
	public ResponseEntity<?> findAllSellerReview(@RequestParam(defaultValue = "1") int pageno, @RequestParam String seller) {
		return ResponseEntity.ok(service.findAllSellerReview(pageno, seller));
	}
	
}
