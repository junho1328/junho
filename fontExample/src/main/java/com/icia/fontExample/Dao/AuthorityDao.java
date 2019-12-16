package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class AuthorityDao {
	@Autowired
	private SqlSessionTemplate tpl;

	public int insert(String username, String authority) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("username", username);
		map.put("authority", authority);
		return tpl.insert("authorityMapper.insert", map);
	}

	public int delete(String username) {
		return tpl.delete("authorityMapper.delete", username);
	}
}
