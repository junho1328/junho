package com.icia.fontExample.entity;

import java.util.*;

import org.springframework.format.annotation.*;

import com.fasterxml.jackson.annotation.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Notice {
	private long no;
	private String title;
	private String username;
	private String content;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd") // 출력 받는
	@DateTimeFormat(pattern="yyyy-MM-dd") // 입력 하는
	private Date notice_date;
}
