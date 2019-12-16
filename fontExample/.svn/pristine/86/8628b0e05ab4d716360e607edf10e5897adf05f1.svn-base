package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class TagDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public int tagInsert(Tag tag) {
		return tpl.insert("tagMapper.insert", tag);
	}

	public String tagCheck(String name) {
		return tpl.selectOne("tagMapper.tagcheck", name);
	}

	public List<Tag> findHotTag() {
		return tpl.selectList("tagMapper.findHotTag");
	}
	
	
}
