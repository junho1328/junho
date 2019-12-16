package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class ReadSellerReviewDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public int findCount(String seller) {
		return tpl.selectOne("readSellerReviewMapper.findCount", seller);
	}

	public List<SellerReview> findEachSeller(int startRowNum, int endRowNum, String seller) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("seller", seller);
		return tpl.selectList("readSellerReviewMapper.findEachSeller", map);
	}
}
