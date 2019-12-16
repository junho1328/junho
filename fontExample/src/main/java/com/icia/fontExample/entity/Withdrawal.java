package com.icia.fontExample.entity;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Withdrawal {
	private String reason; // 객관식 
	private String reason_detail; // 주관식
	private long retire_count; // 카운트 수 
}
