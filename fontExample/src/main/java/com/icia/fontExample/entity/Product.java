 package com.icia.fontExample.entity;

import java.util.*;

import com.fasterxml.jackson.annotation.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Product {
	private long no;
	private long lno;
	private long sno;
	private String name;
	private long price;
	private String image;
	private long quantity;
	private long state;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date productDate;
}