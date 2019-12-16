package com.icia.fontExample.Service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.date.dto.*;
import com.icia.fontExample.entity.*;

@Service
public class ExchangeService {
	@Autowired
	private ExchangeDao dao;
	private Exchange exchange;
	
	public int insert(Exchange exchange) {
		dao.insert(exchange);
		return 1;
	}
	public List<Exchange> findAll() {
		return dao.findAll();
	}
	public List<Exchange> findExchangeNo(long no) {
		return dao.findExchangeNo(no);
	}
	public List<Exchange> findExchangeID(String username) {
		return dao.findExchangeID(username);
	}
	public List<Exchange> findExchangeName(String name) {
		return dao.findExchangeName(name);
	}
	public List<Exchange> findExchangeDay(Date changeday) {
		return dao.findExchangeDay(changeday);
	}
//	public int delete(long no,String username,String name,long amount,String bank,String account,Date changeday) {
//		dao.insert(exchange);
//		return dao.delete(no);
//	}
	public String delete(List<Integer> list) {
		for(Integer no:list) {
			dao.delete(no);
		}
		return "내역을 삭제했습니다";
	}
	public ExchangePage exchangeAllRead(int pageno, int pagesize) {
		int count = dao.findCount();
		//	pageno	pagesize	startRowNum		endRowNum
		// 		1 		10			0				10
		// 		2 		10			11				20
		int startRowNum = ((pageno-1) * pagesize + 1);
		int endRowNum = startRowNum + pagesize -1;
		if(endRowNum >= count)
			endRowNum = count;
		List<Exchange> exchange = dao.findAllPage(startRowNum, endRowNum);
		return new ExchangePage().builder().pageno(pageno).pagesize(pagesize).totalcount(count).exchangePage(exchange).build();
	}
}