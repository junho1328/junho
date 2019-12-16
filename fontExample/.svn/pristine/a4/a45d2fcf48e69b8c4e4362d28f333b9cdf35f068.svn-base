package com.icia.fontExample.entity;

import java.util.*;

import org.springframework.format.annotation.*;

import com.fasterxml.jackson.annotation.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Declaration {
	private long no;
	private String username;
	private String declaration_username;
	private long reason_no;
	private String content;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date declaration_date;
}


