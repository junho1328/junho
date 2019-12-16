package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class ExchangeDao {

	@Autowired
	private SqlSessionTemplate tpl;
	
	public int insert(Exchange exchange) {
		return tpl.insert("exchangeMapper.insert",exchange);
	}

	public List<Exchange> findAll() {
		return tpl.selectList("exchangeMapper.findAll");
	}
	
	public List<Exchange> findExchangeNo(long no){
		return tpl.selectList("exchangeMapper.findExchangeNo",no);
	}
	
	public List<Exchange> findExchangeID(String username){
		return tpl.selectList("exchangeMapper.findExchangeID",username);
	}

	public List<Exchange> findExchangeName(String name){
		return tpl.selectList("exchangeMapper.findExchangeName",name);
	}
	public List<Exchange> findExchangeDay(Date changeday){
		return tpl.selectList("exchangeMapper.findExchangeDay",changeday);
	}
	public int delete(long no) {
		return tpl.delete("exchangeMapper.delete",no);
	}
	public List<Exchange> findAllPage(int startRowNum, int endRowNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRowNum",startRowNum);
		map.put("endRowNum",endRowNum);
		return tpl.selectList("exchangeMapper.exchangePage",map);
	}

	public int findCount() {
		return tpl.selectOne("exchangeMapper.findCount");
	}
}