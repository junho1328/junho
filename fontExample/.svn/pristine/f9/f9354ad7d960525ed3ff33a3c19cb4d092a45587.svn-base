package com.icia.fontExample.entity;

import java.util.*;

import com.fasterxml.jackson.annotation.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductInquiry {
	private long no;
	private long product_no;
	private String username;
	private String question;
	private String answer;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date iquiry_date;
	
	//no, product_no, username, question, answer, inquiry_date
}
