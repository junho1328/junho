package com.icia.fontExample.Dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PayAuthDto {
	int code;
	String message;
	PayAuthAnnoDto response;
}
