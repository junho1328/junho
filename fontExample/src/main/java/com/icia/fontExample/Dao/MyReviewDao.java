package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class MyReviewDao {
	@Autowired
	private SqlSessionTemplate tpl;

	public int findCount() {
		return tpl.selectOne("MyReviewMapper.findCount");
	}

	public List<MyReview> findAll(int startRowNum, int endRowNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return tpl.selectList("MyReviewMapper.findAll", map); 
	}
}
