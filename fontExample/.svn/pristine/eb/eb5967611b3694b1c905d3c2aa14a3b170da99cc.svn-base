package com.icia.fontExample.entity;

import java.util.*;

import org.springframework.format.annotation.*;

import com.fasterxml.jackson.annotation.*;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Favorite {
	private long no;
	private long pno;
	private String image;
	private String name;
	private long price;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private Date productDate;
	private int state;
}
