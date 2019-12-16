package com.icia.fontExample.entity;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SellReviewInfo {
	private String username;
	private String image;
	private String product;
	private String content;
	private long trust;
}
