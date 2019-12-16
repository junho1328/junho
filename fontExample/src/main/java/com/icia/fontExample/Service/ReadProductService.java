package com.icia.fontExample.Service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.date.dto.*;
import com.icia.fontExample.entity.*;

@Service
public class ReadProductService {
	@Autowired
	private ReadProductDao dao;

	public ReadProduct readProductTop(long no, String username) {
		return dao.readProductTop(no);
	}
	
	public List<Object> readProductInquiry(long no, String username) {
		return dao.readProductInquiry(no);
	}

	public ProductInquiryPage findByPage(int pageno, int pagesize, long no) {
		int count = dao.findCount(no);
		//	pageno	pagesize	startRowNum		endRowNum
		// 		1 		5			0				5
		// 		2 		5			6				10
		//		3		5			11				15
		int startRowNum = ((pageno-1) * pagesize + 1);
		int endRowNum = startRowNum + pagesize-1;
		if(endRowNum >= count)
			endRowNum = count;
		List<ProductInquiry> productInquiry = dao.findByPage(startRowNum, endRowNum, no);
		return new ProductInquiryPage().builder().pageno(pageno).pagesize(pagesize).totalcount(count).productInquiryPage(productInquiry).build();
	}

	public int insertInQuestion(ProductInquiry productinquiry, String username) {
		return dao.insertInQuestion(productinquiry);
	}

	public int insertInAnswer(long no, String answer, String username) {
		return dao.insertInAnswer(no, answer);
	}

	public ReadProduct readSeller(long no, String username1) {
		return dao.readSeller(no);
	}
	/*
	public ReadProduct readProductTag(long no, String username) {
		return dao.readProductTag(no);
	}
	*/
	
	
	/*
	public Object updateProduct(ReadProduct readProduct, String name) {
		if(!name.equals(dao.findWriterById(readProduct.getNo())))
			new IllegalAccessException();
		dao.updateProduct(readProduct);
		return null;
	}
	*/

	
	
}
