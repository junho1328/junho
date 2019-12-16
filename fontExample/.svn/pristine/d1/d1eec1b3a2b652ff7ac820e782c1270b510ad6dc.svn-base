package com.icia.fontExample.Dao;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class JoinDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public String checkId(String username) {
		return tpl.selectOne("joinMapper.checkId", username);
	}

	public String checkEmail(String email) {
		return tpl.selectOne("joinMapper.checkEmail", email);
	}

}
