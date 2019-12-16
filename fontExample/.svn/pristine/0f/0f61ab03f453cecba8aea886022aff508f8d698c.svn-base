package com.icia.fontExample.entity;

import java.util.*;

import com.fasterxml.jackson.annotation.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SellerReview {

	private long no;
	private String username;
	private String seller;
	private String image;
	private String product;
	private String content;
	private long trust;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date sellerReviewDate;
}
