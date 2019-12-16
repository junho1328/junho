package com.icia.fontExample.entity;

import java.util.*;

import com.fasterxml.jackson.annotation.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReadProduct {
	private String no;
	private String image;
	private String name;
	private int price;
	private int quantity;
	private String area;
	private String tagname;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date product_date;
	private String img;
	private String infomation;
	private String sellerimage;
	private String sellername;
	private String username;
	private int trust;
	private int count;
}
