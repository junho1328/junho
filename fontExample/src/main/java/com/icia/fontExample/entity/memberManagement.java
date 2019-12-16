package com.icia.fontExample.entity;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class memberManagement {
	public String name;
	public String username;
	public String authority;
	public int 	point;
	public int  count;
	public int 	block;
}
