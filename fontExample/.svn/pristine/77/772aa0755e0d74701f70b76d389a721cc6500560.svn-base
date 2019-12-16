package com.icia.fontExample.Dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class testDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public String findCount() {
		return tpl.selectOne("adminMapper.testsql"); 
	}
}
