package com.icia.fontExample.entity;

import java.util.*;

import com.fasterxml.jackson.annotation.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Summary {
	private long no;
	private long productNo;
	private String buyerUsername;
	private String sellerUsername;
	private long amount;
	private int quantity;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date checkDate;
	private long method;
	private String name;
	private long price;
	private String image;
	private String tel;
}
