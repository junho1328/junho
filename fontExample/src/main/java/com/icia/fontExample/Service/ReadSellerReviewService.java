package com.icia.fontExample.Service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.date.dto.*;
import com.icia.fontExample.entity.*;

@Service
public class ReadSellerReviewService {
	@Autowired
	private ReadSellerReviewDao dao;
	@Value("5")
	private int pagesize;
	
	public SRPage findAllSellerReview(int pageno, String seller) {
		int count = dao.findCount(seller);
		int startRowNum = ((pageno-1) * pagesize + 1);
		int endRowNum = startRowNum + pagesize -1;
		if(endRowNum >= count)
			endRowNum = count;
		List<SellerReview> sellerReview = dao.findEachSeller(startRowNum, endRowNum, seller);
		return new SRPage().builder().pageno(pageno).pagesize(pagesize).totalcount(count).sellerReview(sellerReview).build();
	}

}
