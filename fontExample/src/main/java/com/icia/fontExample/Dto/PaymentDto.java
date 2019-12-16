package com.icia.fontExample.Dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PaymentDto {
	int code;
	String message;
	PaymentInfoDto response;
}
