 package com.icia.fontExample.entity;

import java.util.*;

import com.fasterxml.jackson.annotation.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Purchase {
	private long no;
	private long product_no;
	private long address_no;
	private String username;
	private String seller;
	private long amount;
	private int quantity;
	private int method;
	private int state;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	Date purchaseDate;
	
}