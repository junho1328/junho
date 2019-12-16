package com.icia.fontExample.Controller;

import java.net.*;

import javax.mail.*;
import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.security.core.*;
import org.springframework.security.web.authentication.logout.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.*;

import com.icia.fontExample.Service.*;

import lombok.*;

@RequestMapping("/api")
@CrossOrigin("*")
@RestController
public class TradeRestController {
	@Autowired
	private MemberService service;
	
	@Secured("ROLE_MEMBER")
	@PostMapping(path="/cachecheck", produces="text/plain;charset=utf-8")
	public ResponseEntity<?> cachecheck(String no){
		return ResponseEntity.ok(no);
	}
	
}
