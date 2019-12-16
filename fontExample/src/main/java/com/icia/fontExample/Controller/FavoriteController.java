package com.icia.fontExample.Controller;

import java.io.*;
import java.lang.reflect.*;
import java.security.*;
import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.security.access.annotation.*;
import org.springframework.web.bind.annotation.*;

import com.fasterxml.jackson.core.*;
import com.fasterxml.jackson.databind.*;
import com.icia.fontExample.Service.*;

@Secured("ROLE_MEMBER")
@RequestMapping("/api")
@RestController
public class FavoriteController {
	@Autowired
	private FavoriteService service;
	@Autowired
	private ObjectMapper objectMapper;
	
	@PostMapping(path="/favorite",produces="text/plain;charset=utf-8")
	public ResponseEntity<?> insertFavorite(Principal principal,long productNo){
		return ResponseEntity.ok(service.insert(principal.getName(), productNo));
	}
	@GetMapping("/favorite")
	public ResponseEntity<?> findFavorite(Principal principal){
		return ResponseEntity.ok(service.findFavorite(principal.getName()));
	}
	@DeleteMapping(path="/favorite",produces="text/plain;charset=utf-8")
	public ResponseEntity<?> delete(String json) throws JsonParseException, JsonMappingException, IOException{
		String str = json.replaceAll("&quot;", "");
		Integer[] arr = objectMapper.readValue(str, Integer[].class);
		List<Integer> list = Arrays.asList(arr);
		return ResponseEntity.ok(service.delete(list));
	}
	@DeleteMapping(path="/favorite/soldout",produces="text/plain;charset=utf-8")
	public ResponseEntity<?> deleteBySoldout(Principal principal){
		return ResponseEntity.ok(service.deleteBySoldout(principal.getName()));
	}
}
