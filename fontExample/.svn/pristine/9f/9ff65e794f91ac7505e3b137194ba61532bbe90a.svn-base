package com.icia.fontExample.Dao;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class SalesRightsDao {
	@Autowired
	private SqlSessionTemplate tpl;
	// 판매자를 추가한다 , 권한을 추가한다
	public int insert(Seller seller) {
		 return tpl.insert("SalesRightsMapper.insertSales",seller);
	}
	public int delete(String username) {
		return tpl.delete("withdrawalMapper.sellerdelete",username);
	
	}
	public String checkName(String name) {
		return tpl.selectOne("SalesRightsMapper.checkName",name);
	}
	public String checkSns(String sns) {
		return tpl.selectOne("SalesRightsMapper.checkSns",sns);
	}
	public String checkAccount(String account) {
		return tpl.selectOne("SalesRightsMapper.checkAccount",account);
	}
	
}
