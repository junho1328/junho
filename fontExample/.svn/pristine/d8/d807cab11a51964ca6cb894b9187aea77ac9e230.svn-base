package com.icia.fontExample.Controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.icia.fontExample.Service.*;

@RestController
@RequestMapping("/api")
public class ProductListRestController {
	@Autowired
	private ProductListService service;
	
	@GetMapping("/productListsWithoutPage")
	public ResponseEntity<?> findAll() {
		return ResponseEntity.ok(service.findAll());
	}
	@GetMapping("/productLists")
	public ResponseEntity<?> findAllByPageNo(@RequestParam(defaultValue = "1") int pageno) {
		return ResponseEntity.ok(service.findAllByPageNo(pageno));
	}
	
	@GetMapping("/productLists/Large")
	public ResponseEntity<?> findPageByLno(@RequestParam(defaultValue = "1") int pageno,@RequestParam long lno){
		return ResponseEntity.ok(service.findPageByLno(pageno,lno));
	}
	@GetMapping("/productLists/Small")
	public ResponseEntity<?> findPageBySno(@RequestParam(defaultValue = "1") int pageno,@RequestParam long sno){
		return ResponseEntity.ok(service.findPageBySno(pageno,sno));
	}
	@GetMapping("/productLists/Name")
	public ResponseEntity<?> findPageByProName(@RequestParam(defaultValue = "1") int pageno,@RequestParam String pname){
		System.out.println(pname);
		return ResponseEntity.ok(service.findPageByProName(pageno, pname));
	}
}
