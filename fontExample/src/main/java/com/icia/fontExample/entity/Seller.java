package com.icia.fontExample.entity;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Seller {
	private String username;
	private String image;
	private String name;
	private int count;
	private String tel;
	private String sns;
	private long amount;
	private String account;
}
