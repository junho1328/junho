package com.icia.fontExample.Controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.icia.fontExample.Service.*;
@RequestMapping("/api")
@RestController
public class MemberManagementContorller {
	@Autowired 
	private MemberService service;
	
	@GetMapping("/memberManagement")
	public ResponseEntity<?> findAll(){
		return ResponseEntity.ok(service.findAll());
	}
	@PostMapping("/memberManagement/block")
	public ResponseEntity<?> blockMember(@PathVariable String username , @PathVariable int block){
		return ResponseEntity.ok(service.memberBlock(username,block));
	}
	@PostMapping("/memberManagement/unBlock")
	public ResponseEntity<?> unBlockMember(@PathVariable String username, @PathVariable int block){
		return ResponseEntity.ok(service.memberUnBlock(username,block));
	}
	
	
	
}
