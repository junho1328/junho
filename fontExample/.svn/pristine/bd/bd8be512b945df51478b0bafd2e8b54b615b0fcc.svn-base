package com.icia.fontExample.Controller;

import java.io.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.icia.fontExample.util.*;

@RestController
public class BoardRestController {
	@Autowired
	private saveCKImage ckimage;
	
	@PostMapping("/ckupload")
	public ResponseEntity<?> ckImageUpload(MultipartFile upload) throws IllegalStateException, IOException{
		return ResponseEntity.ok(ckimage.saveCKImages(upload));
	}
}
