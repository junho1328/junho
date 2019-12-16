package com.icia.fontExample.entity;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Inquiry {
	private long no;
	private String username;
	private long type_no;
	private String title;
	private String content;
	private String answer;
	private long process;
}
