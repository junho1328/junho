package com.icia.fontExample.Controller;

import java.io.*;
import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.icia.fontExample.Service.*;
import com.icia.fontExample.entity.*;

@RequestMapping("/api")
@RestController
public class SellerReviewController {
	@Autowired
	private SellerReviewService service;
	
//	@Secured("ROLE_USER")
//	@PostMapping("/sellReviewReport")
//	public ResponseEntity<?> writeSellerReview(@Valid SellerReview sellerReview, BindingResult results, Principal principal, HttpServletRequest req) throws BindException {
//		if(results.hasErrors())
//			throw new BindException(results);
//		SellerReview result = service.writeSellerReview(sellerReview);
//		URI location = UriComponentsBuilder.newInstance().path("/fontExample/api/sellerReviews").path(result.getNo()+"").build().toUri();
//		return ResponseEntity.created(location).body(result.getNo());
//	}
	
	
	@PostMapping(path="/sellReviewReport",produces="application/json;charset=utf-8")
	public ResponseEntity<?> SellerReviewInsert(SellReviewInfo sellReviewInfo, MultipartFile productImage, Principal principal) throws BindException, IllegalStateException, IOException {
//		if(results.hasErrors())
//			throw new BindException(results);
		System.out.println("컨트롤러 이미지 : " + productImage);
		System.out.println(sellReviewInfo);
		String writer = principal.getName();
		return ResponseEntity.ok(service.insert(sellReviewInfo, productImage, writer));
	}
	
//	@Secured("ROLE_USER")
//	@PatchMapping("/sellerReviews/trustUp")
//	public ResponseEntity<?> trustUp(@NonNull Long no, Principal principal) {
//		return ResponseEntity.ok(service.trustUp(no, principal.getName()));
//	}
//	
//	@Secured("ROLE_USER")
//	@PatchMapping("/sellerReviews/trustDown")
//	public ResponseEntity<?> trustDown(@NonNull Long no, Principal principal) {
//		return ResponseEntity.ok(service.trustDown(no, principal.getName()));
//	}
}
