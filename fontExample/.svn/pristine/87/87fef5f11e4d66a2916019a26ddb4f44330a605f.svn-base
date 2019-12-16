package com.icia.fontExample.Service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.date.dto.*;
import com.icia.fontExample.entity.*;

@Service
public class InquiryService {

	@Autowired
	private InquiryDao dao;

	public Long insert(Inquiry inquiry) {
		dao.insert(inquiry);
		return inquiry.getNo();
	}
	public Inquiry inquiryByNo(Long no) {
		return dao.inquiryByNo(no);
	}

	public List<Inquiry> findAll(String username){
		return dao.findAll(username);
	}
	public InquiryPage inquiryMyAllRead(int pageno, int pagesize, String username) {
		int count = dao.findCount();
		//	pageno	pagesize	startRowNum		endRowNum
		// 		1 		10			0				10
		// 		2 		10			11				20
		int startRowNum = ((pageno-1) * pagesize + 1);
		int endRowNum = startRowNum + pagesize -1;
		if(endRowNum >= count)
			endRowNum = count;
		List<Inquiry> inquiry = dao.findByMyPage(startRowNum, endRowNum, username);
		return new InquiryPage().builder().pageno(pageno).pagesize(pagesize).totalcount(count).inquiryPage(inquiry).build();
	}
	public InquiryPage inquiryAllRead(int pageno, int pagesize) {
		int count = dao.findCount();
		//	pageno	pagesize	startRowNum		endRowNum
		// 		1 		10			0				10
		// 		2 		10			11				20
		int startRowNum = ((pageno-1) * pagesize + 1);
		int endRowNum = startRowNum + pagesize -1;
		if(endRowNum >= count)
			endRowNum = count;
		List<Inquiry> inquiry = dao.findByPage(startRowNum, endRowNum);
		return new InquiryPage().builder().pageno(pageno).pagesize(pagesize).totalcount(count).inquiryPage(inquiry).build();
	}
	public int delete(long no) {
		return dao.delete(no);
	}
}
