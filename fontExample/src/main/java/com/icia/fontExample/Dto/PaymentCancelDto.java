package com.icia.fontExample.Dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class PaymentCancelDto {
	String pg_tid;
	long amount;
	int cancelled_at;
	String reason;
	String receipt_url;
}
