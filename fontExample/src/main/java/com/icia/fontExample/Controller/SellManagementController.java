package com.icia.fontExample.Controller;

import java.security.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.web.bind.annotation.*;

import com.icia.fontExample.Service.*;

@RequestMapping("/api")
@RestController
public class SellManagementController {
	@Autowired
	private SellService service;
	
		//관리자일때 판매글들을 전부 보여준다.
		//@Secured("ROLE_ADMIN")
		@GetMapping("sellManagement/adminList")
		public ResponseEntity<?> findAllBoard(@RequestParam(defaultValue = "1") int pageno){
			return ResponseEntity.ok(service.findAllSalesArtice(pageno));
		}
		// 시험 코드임
		@GetMapping("sellManagement/adminListNew")
		public ResponseEntity<?> findNewBoard(@RequestParam int no,@RequestParam int block){
			return ResponseEntity.ok(service.newFindAllSalesArtice(no,block));
		}
		
		//판매자일때 자신의 판매글들을 보여준다.
		//@Secured("ROLE_SELLER")
		@GetMapping("/sellManagement/List")
		public ResponseEntity<?> findAllBoardByWriter(@RequestParam(defaultValue = "1") int pageno,@RequestParam String writer){
			return ResponseEntity.ok(service.findAllSalesArticeByWriter(pageno,writer));
		}
		//일반유저 = 구매자 일때는 그냥 페이지를 안보여주나? 코딩을 일부러 안하면
		
				
		//판매자와 관리자는 판매글을 삭제 할 수 있다.
		@Secured("{ROLE_ADMIN,ROLE_SELLER}")
		@DeleteMapping("/deleteSellManagemt ")
		public ResponseEntity<?> deleteBoard(@PathVariable long bno,@RequestParam Principal principal) {
			return ResponseEntity.ok(service.deleteSalesArtice(bno, principal.getName()));
		}
		
		//판매자와 관리자는 판매글들을 삭제 할 수 있다.
		@Secured("{ROLE_ADMIN,ROLE_SELLER}")
		@DeleteMapping("/deleteCheckSellManagement")
		public ResponseEntity<?> deleteByCheck(@RequestParam List bno,@RequestParam Principal principal){
			return ResponseEntity.ok(service.deleteByCheck(bno,principal.getName()));
		}
		//관리자는 판매글을 숨길 수 있다.
		@Secured("ROLE_ADMIN")
		@GetMapping("/hideSellManagement")
		public ResponseEntity<?> hideSalesArtice(@RequestParam long bno,@RequestParam Principal principal){
			return ResponseEntity.ok(service.hideSalesArtice(bno, principal.getName()));
		}
		//관리자는 숨겨진 판매글을 풀 수 있다.
		@Secured("ROLE_ADMIN")
		@GetMapping("/unHideSellManagement")
		public ResponseEntity<?> unhideSalesArtice(@RequestParam long bno,@RequestParam Principal principal){
			return ResponseEntity.ok(service.unHideSalesArtice(bno, principal.getName()));
		}
		//관리자는 판매글들을 숨길수 있다.
		@Secured("ROLE_ADMIN")
		@GetMapping("/hideCheckSellManagement")
		public ResponseEntity<?> hideByCheck(@RequestParam List bno,@RequestParam Principal principal){
			return ResponseEntity.ok(service.hideByCheck(bno,principal.getName()));
		}
			
		//관리자는 숨겨진 판매글을 풀 수 있다
		@Secured("ROLE_ADMIN")
		@GetMapping("/unHideCheckSellManagement")
		public ResponseEntity<?> unHideByCheck(@RequestParam List bno,@RequestParam Principal principal){
			return ResponseEntity.ok(service.unHideByCheck(bno, principal.getName()));
		}
		
	
}
