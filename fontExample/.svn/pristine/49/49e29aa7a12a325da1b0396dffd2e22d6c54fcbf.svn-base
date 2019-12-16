package com.icia.fontExample.Dao;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class LoginDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public String findLoginFailureCount(String username) {
		String count = tpl.selectOne("loginJobMapper.findLoginFailureCount", username);
		return count;
	}

	public Integer increaseLoginFailureCount(String username) {
		return tpl.update("loginJobMapper.increaseLoginFailureCount", username);
	}
	
	public int block(String username) {
		return tpl.update("loginJobMapper.block", username);
	}
	
	public int unBlock(String username) {
		return tpl.update("loginJobMapper.unblock", username);
	}
	
	public int resetLoginFailureCount(String username) {
		return tpl.update("loginJobMapper.resetLoginFailureCount", username);
	}
}
