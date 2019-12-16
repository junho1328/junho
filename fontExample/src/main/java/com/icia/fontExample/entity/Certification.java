package com.icia.fontExample.entity;

import java.util.*;

import org.springframework.format.annotation.*;

import com.fasterxml.jackson.annotation.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Certification {
	private String username;
	private int email_Certification;
	private int tel_Certification;
}


