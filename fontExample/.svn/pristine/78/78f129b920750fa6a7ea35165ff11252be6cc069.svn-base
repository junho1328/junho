package com.icia.fontExample.Dao;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class SellerDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public Seller findSeller(String username) {
		return tpl.selectOne("sellerMapper.findSeller", username);
	}

	public Seller findSellerAll(String username) {
		return tpl.selectOne("sellerMapper.findSellerAll", username);
	}
	
	public int insert(Seller seller) {
		return tpl.selectOne("sellerMapper.insert", seller);
	}

}
