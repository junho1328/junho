package com.icia.fontExample.entity;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Member {
	private String username;
	private String password;
	private String name;
	private String email;
	private int trust;
	private int enabled;
	private int point;
	private String tel;
	private int login_failure_cnt;
}
