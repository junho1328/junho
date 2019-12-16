package com.icia.fontExample.entity;

import java.util.*;

import org.springframework.format.annotation.*;

import com.fasterxml.jackson.annotation.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Exchange {
	private long no;
	private String username;
	private String name;
	private long amount;
	private String bank;
	private String account;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd") // 출력 받는
	@DateTimeFormat(pattern="yyyy-MM-dd") // 입력 하는
	private Date changeday;
}
