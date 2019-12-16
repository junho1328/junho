 package com.icia.fontExample.entity;

import java.util.*;

import com.fasterxml.jackson.annotation.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class WaitingPoint {
	private long no;
	private String buyUsername;
	private String sellUsername;
	private long point;
}