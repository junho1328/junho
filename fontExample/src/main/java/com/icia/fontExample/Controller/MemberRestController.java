package com.icia.fontExample.Controller;

import java.io.*;
import java.net.*;

import javax.mail.*;
import javax.servlet.http.*;
import javax.validation.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.prepost.*;
import org.springframework.security.core.*;
import org.springframework.security.web.authentication.logout.*;
import org.springframework.validation.*;
import org.springframework.validation.BindException;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.*;

import com.icia.fontExample.Service.*;
import com.icia.fontExample.entity.*;

import io.swagger.annotations.*;
import lombok.*;

@RequestMapping("/api")
@CrossOrigin("*")
@RestController
public class MemberRestController {
	@Autowired
	private MemberService service;
	@PostMapping(path="/join")
	public ResponseEntity<?> join(@ModelAttribute @Valid Member member, BindingResult results) throws BindException, IOException {
		if(results.hasErrors())
			throw new BindException(results);
		System.out.println("restcontroller"+member);
		URI location = UriComponentsBuilder.newInstance().path("/fontExample/").build().toUri();
		return ResponseEntity.created(location).body(service.insert(member));
	}
	@GetMapping(path="/findId", produces="text/plain;charset=utf-8")
	public ResponseEntity<?> findId(@NonNull String name, @NonNull String tel) throws MessagingException {
		return ResponseEntity.ok(service.findId(name, tel));
	}
	@GetMapping(path="/findMemberByUsername")
	public ResponseEntity<?> findMemberByUsername(@NonNull String username) throws MessagingException {
		return ResponseEntity.ok(service.findMemberByUsername(username));
	}
	@PostMapping(path="/changePwd", produces="text/plain;charset=utf-8")
	public ResponseEntity<?> resetPwd(@NonNull String name, @NonNull String tel) throws MessagingException {
		return ResponseEntity.ok(service.changePwd(name, tel));
	}
	@PostMapping(path="/email/certification", produces="text/plain;charset=utf-8")
	public ResponseEntity<?> emailCertification(@NonNull String email, @NonNull String random) throws MessagingException {
		return ResponseEntity.ok(service.emailCertification(email, random));
	}
	
}
