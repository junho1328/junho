package com.icia.fontExample.date.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MyReviewDto {
	private String no;
	private String username;
	private String seller;
	private String image;
	private String product;
	private String content;
	private String trust;
}
