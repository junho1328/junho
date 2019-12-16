package com.icia.fontExample.Service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.date.dto.*;
import com.icia.fontExample.entity.*;

@Service
public class MyReviewService {
	@Autowired
	private MyReviewDao dao;
	@Value("5")
	private int pagesize;

	public MYPage findAllReviewByUsername(int pageno) {
			int count = dao.findCount();
			int startRowNum = ((pageno-1) * pagesize + 1);
			int endRowNum = startRowNum + pagesize -1;
			if(endRowNum >= count)
				endRowNum = count;
			List<MyReview> myReview = dao.findAll(startRowNum, endRowNum);
			return new MYPage().builder().pageno(pageno).pagesize(pagesize).totalcount(count).myReview(myReview).build();
	}
}