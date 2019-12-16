package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class ChangePwdDao {
	@Autowired
	private SqlSessionTemplate tpl;

	public Member findById(String username) {
		return tpl.selectOne("changePwdMapper.findById", username);
	}

	public int changePwd(String username, String password) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("username", username);
		map.put("password", password);
		return tpl.update("changePwdMapper.changePwd", map);
	}
	
}
