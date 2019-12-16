package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class SummaryDao {
	@Autowired
	private SqlSessionTemplate tpl;

	public int findCountByBuy(String username) {
		return tpl.selectOne("summaryMapper.findCountByBuy", username);
	}
	
	public int findCountBySell(String username) {
		return tpl.selectOne("summaryMapper.findCountBySell", username);
	}
	public List<Summary> findAllByBuyHistory(int startRowNum, int endRowNum, String username) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("username", username);
		return tpl.selectList("summaryMapper.findAllByBuyHistory", map);
	}

	public List<Summary> findAllBySellHistory(int startRowNum, int endRowNum, String username) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("username", username);
		return tpl.selectList("summaryMapper.findAllBySellHistory", map);
	}
	public int insert(Summary summary) {
		return tpl.insert("summaryMapper.insert",summary);
	}
	public int deleteById(long no) {
		return tpl.delete("summaryMapper.deleteById",no);
	}

}
