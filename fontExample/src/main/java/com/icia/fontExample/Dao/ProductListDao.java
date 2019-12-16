package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class ProductListDao {
	@Autowired
	private SqlSessionTemplate tpl;

	public int findCount() {
		return tpl.selectOne("productListMapper.findCount");
	}

	public List<Sell> findAllByPageNo(int startRowNum, int endRowNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return tpl.selectList("productListMapper.findAllByPageNo", map);
	}

	public List<Product> findAll() {
		return tpl.selectList("productListMapper.findAll");
	}

	public int findCountByLno(long lno) {
		return tpl.selectOne("productListMapper.findCountByLno",lno);
	}

	public int findCountBySno(long sno) {
		return tpl.selectOne("productListMapper.findCountBySno",sno);
	}
	
	public int findCountByProName(String pname) {
		return tpl.selectOne("productListMapper.findCountByProName",pname);
	}
	public List<Sell> findPageByLno(int startRowNum, int endRowNum, long lno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("lno",lno);
		return tpl.selectList("productListMapper.findPageByLno", map);
	}

	public List<Sell> findPageBySno(int startRowNum, int endRowNum, long sno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("sno",sno);
		return tpl.selectList("productListMapper.findPageBySno", map);
	}
	
	public List<Sell> findPageByProName(int startRowNum, int endRowNum, String pname) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("pname",pname);
		return tpl.selectList("productListMapper.findPageByProName", map);
	}
}
