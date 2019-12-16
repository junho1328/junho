package com.icia.fontExample.Service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.date.dto.*;
import com.icia.fontExample.entity.*;

@Service
public class ProductListService {
	@Autowired
	private ProductListDao dao;
	@Value("12")
	private int pagesize;

	public ProListPage findAllByPageNo(int pageno) {
		int count = dao.findCount();
		int startRowNum = ((pageno-1) * pagesize + 1);
		int endRowNum = startRowNum + pagesize -1;
		if(endRowNum >= count)
				endRowNum = count;
		List<Sell> sell = dao.findAllByPageNo(startRowNum, endRowNum);
		return new ProListPage().builder().pageno(pageno).pagesize(pagesize).totalcount(count).sell(sell).build();
	}

	public List<Product> findAll() {
		return dao.findAll();
	}

	public ProListPage findPageByLno(int pageno, long lno) {
		int count = dao.findCountByLno(lno);
		int startRowNum = ((pageno-1) * pagesize + 1);
		int endRowNum = startRowNum + pagesize -1;
		if(endRowNum >= count)
				endRowNum = count;
		List<Sell> sell = dao.findPageByLno(startRowNum, endRowNum,lno);
		return new ProListPage().builder().pageno(pageno).pagesize(pagesize).totalcount(count).sell(sell).build();
	}

	public ProListPage findPageBySno(int pageno, long sno) {
		int count = dao.findCountBySno(sno);
		int startRowNum = ((pageno-1) * pagesize + 1);
		int endRowNum = startRowNum + pagesize -1;
		if(endRowNum >= count)
				endRowNum = count;
		List<Sell> sell = dao.findPageBySno(startRowNum, endRowNum,sno);
		return new ProListPage().builder().pageno(pageno).pagesize(pagesize).totalcount(count).sell(sell).build();
	}
	public ProListPage findPageByProName(int pageno, String pname) {
		System.out.println(pname);
		int count = dao.findCountByProName(pname);
		int startRowNum = ((pageno-1) * pagesize + 1);
		int endRowNum = startRowNum + pagesize -1;
		if(endRowNum >= count)
				endRowNum = count;
		List<Sell> sell = dao.findPageByProName(startRowNum, endRowNum, pname);
		return new ProListPage().builder().pageno(pageno).pagesize(pagesize).totalcount(count).sell(sell).build();
	}

}
