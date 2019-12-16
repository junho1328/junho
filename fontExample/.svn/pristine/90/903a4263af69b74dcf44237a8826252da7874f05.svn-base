package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class StatisticsDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public int selectTable() {
		return tpl.selectOne("statisticsMapper.selectTable");
	}
	public List<Statistics> findAll(){
		return tpl.selectList("statisticsMapper.findAll");
	}
	public List<Statistics> findAllByToday(){
		return tpl.selectList("statisticsMapper.findAllByToday");
	}
	public int insertTable() {
		return tpl.insert("statisticsMapper.insertTable");
	}
	public int addVisit() {
		return tpl.update("statisticsMapper.addVisit");
	}
	public int addJoin() {
		return tpl.update("statisticsMapper.addJoin");
	}
	public int addDealCount() {
		return tpl.update("statisticsMapper.addDealCount");
	}
	public int addDealAmount(long amount) {
		return tpl.update("statisticsMapper.addDealAmount",amount);
	}
	public String findDealAmountByMonth(String startDay,String endDay) {
		Map<String,String> date = new HashMap<String, String>();
		date.put("startDay",startDay);
		date.put("endDay",endDay);
		return tpl.selectOne("statisticsMapper.findDealAmountByMonth",date);
	}
	public String findDealCountByMonth(String startDay,String endDay) {
		Map<String,String> date = new HashMap<String, String>();
		date.put("startDay",startDay);
		date.put("endDay",endDay);
		return tpl.selectOne("statisticsMapper.findDealCountByMonth",date);
	}
	public String findJoinCountByMonth(String startDay,String endDay) {
		Map<String,String> date = new HashMap<String, String>();
		date.put("startDay",startDay);
		date.put("endDay",endDay);
		return tpl.selectOne("statisticsMapper.findJoinCountByMonth",date);
	}
	public String findVisitCountByMonth(String startDay,String endDay) {
		Map<String,String> date = new HashMap<String, String>();
		date.put("startDay",startDay);
		date.put("endDay",endDay);
		return tpl.selectOne("statisticsMapper.findVisitCountByMonth",date);
	}
}
