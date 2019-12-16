package com.icia.fontExample.Controller;

import java.security.*;

import javax.validation.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;

import com.icia.fontExample.Service.*;
import com.icia.fontExample.entity.*;



@RequestMapping("/api")
@CrossOrigin("*")
@RestController
public class ReadProductController {
	@Autowired
	private ReadProductService service;
	
	@GetMapping("/readProduct/{no}")
	public ResponseEntity<?> readProductTop(@PathVariable long no, Principal principal){
		String username = principal!=null? principal.getName() : null;
		return ResponseEntity.ok(service.readProductTop(no, username));
	}
	
	@GetMapping("/readProductInquiry/{no}")
	public ResponseEntity<?> readProductInquiry(@PathVariable long no, Principal principal){
		String username = principal!=null? principal.getName() : null;
		return ResponseEntity.ok(service.readProductInquiry(no, username));
	}
	/*
	@GetMapping(path="/readProductTag/{no}", produces="text/plain;charset=utf-8")
	public ResponseEntity<?> readProductTag(@PathVariable long no, Principal principal){
		String username = principal!=null? principal.getName() : null;
		return ResponseEntity.ok(service.readProductTag(no, username));
	}
	*/
	@GetMapping("/ProductInquiryPage")
	public ResponseEntity<?> findByPageNo(@RequestParam long no,@RequestParam(defaultValue ="1")int pageno,@RequestParam(defaultValue = "5")int pagesize) {
		System.out.println(no);
		return ResponseEntity.ok(service.findByPage(pageno, pagesize, no));
	}
	
	@Secured("ROLE_MEMBER")
	@PostMapping("/ProductInQuestion")
	public ResponseEntity<?> insertInQuestion(String question,long productNo, Principal principal){
		ProductInquiry productinquiry = new ProductInquiry();
		productinquiry.setQuestion(question);
		productinquiry.setProduct_no(productNo);
		System.out.println(productinquiry);
		productinquiry.setUsername(principal.getName());
		return ResponseEntity.ok(service.insertInQuestion(productinquiry, principal.getName()));
	}
	
//	@Secured("ROLE_SELLER")
	@PostMapping("/ProductInAnswer")
	public ResponseEntity<?> insertInAnswer(long no, String answer, Principal principal){
		return ResponseEntity.ok(service.insertInAnswer(no, answer, principal.getName()));
	}
	
	@GetMapping("/sellerpopup/{no}")
	public ResponseEntity<?> readSeller(@PathVariable long no, Principal principal){
		String username = principal!=null? principal.getName() : null;
		return ResponseEntity.ok(service.readSeller(no, username));
	}
	/*
	// 글 변경, 글쓴 사람인지 여부 principal 필요
	@PutMapping("/readProduct")
	public ResponseEntity<?> updateBoard(@Valid ReadProduct readProduct, BindingResult results, Principal principal) {
		return ResponseEntity.ok(service.updateProduct(readProduct, principal.getName()));
	}
	*/
	/*
	// 글 삭제, 글쓴 사람인지 여부 principal 필요
	@DeleteMapping("/boards/{bno}")
	public ResponseEntity<?> deleteBoard(@PathVariable long bno, Principal principal) {
		return ResponseEntity.ok(service.deleteBoard(bno, principal.getName()));
	}
	*/
	
}
