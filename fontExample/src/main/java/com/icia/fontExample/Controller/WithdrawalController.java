package com.icia.fontExample.Controller;

import javax.servlet.http.*;

import org.apache.ibatis.annotations.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.security.core.*;
import org.springframework.security.web.authentication.logout.*;
import org.springframework.web.bind.annotation.*;

import com.icia.fontExample.Service.*;

import lombok.*;

@RequestMapping("/api")
@RestController
public class WithdrawalController {
	@Autowired
	private WithdrawalService service;
	
	@Secured("ROLE_MEMBER")
	@DeleteMapping("/withdrawals")
	public ResponseEntity<?> withdrawal(@NonNull String username,@NonNull String reason,@NonNull String reason_detail,SecurityContextLogoutHandler handler, HttpServletRequest req, HttpServletResponse res, Authentication auth){
		handler.logout(req, res, auth);
		return ResponseEntity.ok(service.withdrawal(username, reason, reason_detail));
	}
}
