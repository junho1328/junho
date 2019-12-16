package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class InquiryDao {

	@Autowired
	private SqlSessionTemplate tpl;
	
	public int insert(Inquiry inquiry)	{
		return tpl.insert("inquiryMapper.insert",inquiry);
	}
	public Inquiry inquiryByNo(Long no) {
		return tpl.selectOne("inquiryMapper.inquiryByNo", no);
	}
	public List<Inquiry> findAll(String username){
		return tpl.selectList("inquiryMapper.findAll",username);
	}
	
	public int findCount() {
		// TODO Auto-generated method stub
		return tpl.selectOne("inquiryMapper.findCount");
	}
	public List<Inquiry> findByMyPage(int startRowNum, int endRowNum, String username) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum",startRowNum);
		map.put("endRowNum",endRowNum);
		map.put("username", username);
		return tpl.selectList("inquiryMapper.inquiryByMyPage",map);
	}
	public List<Inquiry> findByPage(int startRowNum, int endRowNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRowNum",startRowNum);
		map.put("endRowNum",endRowNum);
		return tpl.selectList("inquiryMapper.inquiryByPage",map);
	}

	public int delete(long no){
		return tpl.delete("inquiryMapper.delete",no);
	}
	
}

