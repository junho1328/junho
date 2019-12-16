package com.icia.fontExample.Controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

import com.icia.fontExample.Service.*;
import com.icia.fontExample.entity.*;

@CrossOrigin("*")
@RequestMapping("/api")
@RestController
public class SiteRestController {
	@Autowired
	private NoticeService service;
	
	@PostMapping(path="/noticeInsert",produces="application/json;charset=utf-8")
	public ResponseEntity<?> noticeInsert(Notice notice) {
		return ResponseEntity.ok(service.insert(notice));
	}
	
	@PostMapping(path="/noticeUpdate",produces="application/json;charset=utf-8")
	public ResponseEntity<?> noticeUpdate(Notice notice, String content1) {
		notice.setContent(content1);
		return ResponseEntity.ok(service.update(notice));
	}
	
	@GetMapping("/noticeRead")
	public ResponseEntity<?> noticeByNo(@RequestParam Long no) {
		return ResponseEntity.ok(service.noticeByNo(no));
	}
	
	@GetMapping("/noticeAllRead")
	public ResponseEntity<?> noticeAllRead(@RequestParam(defaultValue ="1")int pageno,@RequestParam(defaultValue = "10")int pagesize) {
		return ResponseEntity.ok(service.noticeAllRead(pageno, pagesize));
	}
}
