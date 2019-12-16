package com.icia.fontExample.Controller;

import java.io.*;
import java.security.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.web.bind.annotation.*;

import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.databind.*;
import com.icia.fontExample.Service.*;

@RequestMapping("/api")
@RestController
public class SummaryController {
	@Autowired
	private SummaryService service;
	@Autowired
	private ObjectMapper objectMapper;
	
	@Secured("ROLE_MEMBER")
	@GetMapping("/buy_historys")
	@ResponseBody
	public ResponseEntity<?> findAllByBuyHistory(@RequestParam(defaultValue="1") int pageno, Principal principal) {
		String username = principal!=null? principal.getName() : null;
		return ResponseEntity.ok(service.findAllByBuyHistory(pageno, username));
	}
	@Secured("ROLE_MEMBER")
	@GetMapping("/sell_historys")
	@ResponseBody
	public ResponseEntity<?> findAllBySellHistory(@RequestParam(defaultValue="1") int pageno, Principal principal) {
		String username = principal!=null? principal.getName() : null;
		return ResponseEntity.ok(service.findAllBySellHistory(pageno, username));
	}
	@Secured("ROLE_MEMBER")
	@PostMapping("/deleteHistory")
	public ResponseEntity<?> deleteHistory(String json) throws JsonParseException, JsonMappingException, IOException {
		String str = json.replaceAll("&quot;", "");
		Integer[] arr = objectMapper.readValue(str, Integer[].class);
		List<Integer> list = Arrays.asList(arr);
		return ResponseEntity.ok(service.deleteById(list));
	}
}
