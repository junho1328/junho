package com.icia.fontExample.entity;

import java.util.*;

import com.fasterxml.jackson.annotation.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Payment {
	long no;
	String username;
	String impAid;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	Date paymentDate;
	String statue;
	long amount;
	String vBankAccount;
	String vBankBank;
	String vBankName;
}
