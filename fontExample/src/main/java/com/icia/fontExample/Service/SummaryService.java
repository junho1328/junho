package com.icia.fontExample.Service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.date.dto.*;
import com.icia.fontExample.entity.*;

@Service
public class SummaryService {
	@Autowired
	private SummaryDao dao;
	@Value("5")
	private int pagesize;

	public SummaryPage findAllByBuyHistory(int pageno, String username) {
		int count = dao.findCountByBuy(username);
		int startRowNum = ((pageno-1) * pagesize + 1);
		int endRowNum = startRowNum + pagesize -1;
		if(endRowNum >= count)
			endRowNum = count;
		List<Summary> summary = dao.findAllByBuyHistory(startRowNum, endRowNum, username);
		return new SummaryPage().builder().pageno(pageno).pagesize(pagesize).totalcount(count).summarys(summary).build();
	}

	public SummaryPage findAllBySellHistory(int pageno, String username) {
		int count = dao.findCountBySell(username);
		int startRowNum = ((pageno-1) * pagesize + 1);
		int endRowNum = startRowNum + pagesize -1;
		if(endRowNum >= count)
			endRowNum = count;
		List<Summary> summary = dao.findAllBySellHistory(startRowNum, endRowNum, username);
		return new SummaryPage().builder().pageno(pageno).pagesize(pagesize).totalcount(count).summarys(summary).build();
	}

	public String deleteById(List<Integer> list) {
		for(Integer no:list) {
			dao.deleteById(no);
		}
		return "내역을 삭제했습니다";
	}

	
	
}
