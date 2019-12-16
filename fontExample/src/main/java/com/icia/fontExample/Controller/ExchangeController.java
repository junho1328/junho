package com.icia.fontExample.Controller;

import java.io.*;
import java.security.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.databind.*;
import com.icia.fontExample.Service.*;
import com.icia.fontExample.entity.*;

@RequestMapping("/api")
@RestController
public class ExchangeController {
	@Autowired
	private ExchangeService service;
	@Autowired
	private ObjectMapper objectMapper;
	
	@PostMapping("/exchange")
	public ResponseEntity<?> insert(Exchange exchange,Principal principal){
		exchange.setUsername(principal.getName());
		service.insert(exchange);
		return ResponseEntity.ok("등록 완료.");
	}
	
	@GetMapping("/exchange")
	public ResponseEntity<?> findAll(){
		return ResponseEntity.ok(service.findAll());
	}
	
	@GetMapping("/exchange/{no}")
	public ResponseEntity<?> findExchangeNo(long no){
		return ResponseEntity.ok(service.findExchangeNo(no));
	}
	
	@GetMapping("/exchange/{username}")
	public ResponseEntity<?> findExchangeID(String username){
		return ResponseEntity.ok(service.findExchangeID(username));
	}
	@GetMapping("/exchange/{name}")
	public ResponseEntity<?> findExchangeName(String name){
		return ResponseEntity.ok(service.findExchangeName(name));
	}
	@GetMapping("/exchange/{changeday}")
	public ResponseEntity<?> findExchangeDay(Date changeday){
		return ResponseEntity.ok(service.findExchangeDay(changeday));
	}
		
//	@DeleteMapping("/exchangeDelete")
//	public ResponseEntity<?> delete(long no,String username,String name,long amount,String bank,String account,Date changeday){
//		service.delete(no, account, account, amount, account, account, changeday);
//		return ResponseEntity.ok(service.delete(no,username,name,amount,bank,account,changeday));
//	}
	@GetMapping("/exchangeAllRead")
	public ResponseEntity<?> exchangeAllRead(@RequestParam(defaultValue ="1")int pageno,@RequestParam(defaultValue = "10")int pagesize) {
		return ResponseEntity.ok(service.exchangeAllRead(pageno, pagesize));
	}
	
	@PostMapping("/exchangeDelete")
	public ResponseEntity<?> exchangeDelete(String json) throws JsonParseException, JsonMappingException, IOException {
		String str = json.replaceAll("&quot;", "");
		Integer[] arr = objectMapper.readValue(str, Integer[].class);
		List<Integer> list = Arrays.asList(arr);
		return ResponseEntity.ok(service.delete(list));
	}
}
