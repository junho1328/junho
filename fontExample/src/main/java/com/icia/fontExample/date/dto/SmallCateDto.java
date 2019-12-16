package com.icia.fontExample.date.dto;

import java.util.*;

import com.icia.fontExample.entity.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SmallCateDto {
	List<SmallCategory> smallCategory;
}
