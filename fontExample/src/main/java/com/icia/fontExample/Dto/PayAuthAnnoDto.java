package com.icia.fontExample.Dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PayAuthAnnoDto {
	String access_token;
	int expired_at;
	int now;
}
