package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class PointDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public int increasePoint(String username, long point) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username",username);
		map.put("point",point);
		return tpl.update("pointMapper.increasePoint", map);
	}
	public int decreasePoint(String username, long point) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username",username);
		map.put("point",point);
		return tpl.update("pointMapper.decreasePoint", map);
	}
	public long findPointByUsername(String username) {
		return tpl.selectOne("pointMapper.findPointByUsername",username);
	}
}
