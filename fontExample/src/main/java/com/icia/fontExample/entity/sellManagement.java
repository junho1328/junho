package com.icia.fontExample.entity;

import java.util.*;

import com.fasterxml.jackson.annotation.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class sellManagement {
	public int no;
	public int productNo;
	public String username;
	public String area;
	public String infomation;
	public String image;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	public Date sellDate;
	public int block;
}
