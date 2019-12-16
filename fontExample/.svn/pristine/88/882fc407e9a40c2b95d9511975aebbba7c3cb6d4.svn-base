package com.icia.fontExample.Controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.icia.fontExample.Service.*;
import com.icia.fontExample.entity.*;

@RestController
public class SellController {
	@Autowired
	private SellService service;

	@PostMapping("/test/sell")
	public ResponseEntity<?> list(Sell sell) {
		service.insert(sell);
		return ResponseEntity.ok("");
	}
	@GetMapping("/sell")
	public ResponseEntity<?> findAllSell(){
		return ResponseEntity.ok(service.findAllSell());
	}
	@GetMapping("/sell/{no}")
	public ResponseEntity<?> findSell(@PathVariable long no){
		return ResponseEntity.ok(service.findSell(no));
	}
	@GetMapping(path="/findsellerbyno",produces="text/plain;charset=utf-8")
	public ResponseEntity<?> findSellerByNo(@RequestParam long no){
		return ResponseEntity.ok(service.findSellerByNo(no));
	}
	
	@DeleteMapping("/sell")
	public ResponseEntity<?> delete(long no){
		service.delete(no);
		return ResponseEntity.ok("");
	}
	@GetMapping("/sell/findUsername/{no}")
	public ResponseEntity<?> findUsername(@PathVariable long no){
		return ResponseEntity.ok(service.findUsername(no));
				
	}
}
