package com.icia.fontExample.Controller;

import java.io.*;

import javax.validation.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.lang.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.icia.fontExample.Service.*;
import com.icia.fontExample.entity.*;

import lombok.NonNull;

@RequestMapping("/api")
@CrossOrigin("*")
@RestController
public class ProductRestController {
	@Autowired
	private ProductService service;

//	@Secured("ROLE_SELLER")
	@PostMapping(path="/uploadProduct",produces="application/json;charset=utf-8")
	public ResponseEntity<?> productInsert(@ModelAttribute @Valid UploadInfo uploadInfo, BindingResult results,@Nullable MultipartFile productImage) throws BindException, IllegalStateException, IOException {
		if(results.hasErrors())
			throw new BindException(results);
		System.out.println("컨트롤러 이미지 : " + productImage);
		//URI location = UriComponentsBuilder.newInstance().path("/fontExample/readProduct").build().toUri();
		//System.out.println(location);
		//return ResponseEntity.created(location).body(service.insert(uploadInfo));
		return ResponseEntity.ok(service.insert(uploadInfo, productImage));
	}
	
	@GetMapping("/product/findAll")
	public ResponseEntity<?> findAllProduct(){
		return ResponseEntity.ok(service.findAllProduct());
	}
	
	@GetMapping("/product/find")
	public ResponseEntity<?> findProduct(@Valid int no){
		return ResponseEntity.ok(service.findProduct(no));
	}

	@GetMapping("/product/find/price")
	public ResponseEntity<?> findPriceByProduct(@RequestParam int no){
		return ResponseEntity.ok(service.findPriceByProduct(no));
	}
	@PostMapping("/product/quantity")
	public ResponseEntity<?> updateQuantity(@NonNull long no,@NonNull int quantity){
		return ResponseEntity.ok(service.updateQuantity(no, quantity));
	}
	@DeleteMapping("/product/delete")
	public ResponseEntity<?> delete(long no){
		service.delete(no);
		return ResponseEntity.ok("삭제 완료!");
	}
	
}