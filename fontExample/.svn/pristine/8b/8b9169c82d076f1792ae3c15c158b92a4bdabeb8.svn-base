package com.icia.fontExample.Controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.icia.fontExample.Service.*;

@RequestMapping("/api")
@Controller
public class StatisticsController {
	@Autowired
	private StatisticsService service;
	
	@GetMapping("/statistics")
	public ResponseEntity<?> findAll(){
		return ResponseEntity.ok(service.findAll());
	}
	@GetMapping("/statistics/today")
	public ResponseEntity<?> findAllByToday(){
		return ResponseEntity.ok(service.findAllByToday());
	}
	@PostMapping("/statistics/visit")
	public ResponseEntity<?> addvisit(){
		return ResponseEntity.ok(service.AddVisit());
	}
	@PostMapping("/statistics/join")
	public ResponseEntity<?> addjoin(){
		return ResponseEntity.ok(service.AddJoin());
	}
	@PostMapping("/statistics/dealcount")
	public ResponseEntity<?> adddealcount(){
		return ResponseEntity.ok(service.AddDealCount());
	}
	@PostMapping("/statistics/dealamount")
	public ResponseEntity<?> adddealamount(long amount){
		return ResponseEntity.ok(service.AddDealAmount(amount));
	}
	@GetMapping("/statistics/chart")
	public ResponseEntity<?> ChartByMonths(int year,int type){
		return ResponseEntity.ok(service.ChartByMonth(year,type));
	}
}
