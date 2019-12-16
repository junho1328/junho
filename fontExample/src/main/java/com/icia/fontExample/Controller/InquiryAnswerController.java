package com.icia.fontExample.Controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.icia.fontExample.Service.*;
import com.icia.fontExample.entity.*;
@RequestMapping("/api")
@CrossOrigin("*")
@Controller
public class InquiryAnswerController {

	@Autowired
	private InquiryAnswerService service;
	@GetMapping("/inquiryAnswer")
	public ResponseEntity<?> inquiryAnswer(int no){
		return ResponseEntity.ok(service.answerFind(no));
	}
	@PostMapping("/inquiry_answerInsert")
	public ResponseEntity<?> inquiryanswerinsert(Inquiry inquiry){
		return ResponseEntity.ok(service.answerInsert(inquiry));
	}
}

