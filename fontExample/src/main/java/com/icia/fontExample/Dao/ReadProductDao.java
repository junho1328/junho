package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class ReadProductDao {
	@Autowired
	private SqlSessionTemplate tpl;

	public ReadProduct readProductTop(long no) {
		return tpl.selectOne("readProductMapper.readProductTop", no);
	}
	
	public List<Object> readProductInquiry(long no) {
		return tpl.selectList("readProductMapper.readProductInquiry", no);
	}

	public int findCount(long no) {
		return tpl.selectOne("readProductMapper.findCount", no);
	}

	public List<ProductInquiry> findByPage(int startRowNum, int endRowNum, long no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum",startRowNum);
		map.put("endRowNum",endRowNum);
		map.put("no", no);
		return tpl.selectList("readProductMapper.inquiryByPage",map);
	}

	public int insertInQuestion(ProductInquiry productinquiry) {
		return tpl.insert("readProductMapper.insertInQuestion", productinquiry);
	}

	public int insertInAnswer(long no, String answer) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("answer", answer);
		return tpl.update("readProductMapper.insertInAnswer", map);
	}

	public ReadProduct readSeller(long no) {
		return tpl.selectOne("readProductMapper.readSeller", no);
	}
	/*
	public ReadProduct readProductTag(long no) {
		return tpl.selectOne("readProductMapper.readProductTag", no);
	}
	*/
	
	/*
	public Object findWriterById(String no) {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateProduct(ReadProduct readProduct) {
		// TODO Auto-generated method stub
		
	}
	*/

	
}
