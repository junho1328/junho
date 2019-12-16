package com.icia.fontExample.Controller;

import java.security.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.icia.fontExample.Service.*;

import lombok.*;

@CrossOrigin("*")
@RestController
public class ChangePwdController {
	@Autowired
	private ChangePwdService service;

	@PostMapping(path="/changePwd", produces="text/plain;charset=utf-8")
	public ResponseEntity<?> changePwd(@NonNull String password, @NonNull String newPassword, Principal principal) {
		return ResponseEntity.ok(service.changePwd(principal.getName(), password, newPassword));
	}

	@PostMapping(path="/notloginchangePwd", produces="text/plain;charset=utf-8")
	public ResponseEntity<?> notLoginChangePwd(@NonNull String newPassword, @NonNull String username) {
		System.out.println("컨트롤러" + username);
		return ResponseEntity.ok(service.notLoginChangePwd(newPassword, username));
	}
}
