package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class CategoryDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public List<LargeCategory> findAllLargeCategory() {
		return tpl.selectList("categoryMapper.findAllLargeCategory");
	}

	public List<SmallCategory> findAllSmallCategory() {
		return tpl.selectList("categoryMapper.findAllSmallCategory");
	}

	public List<Map> findAllTag() {
		return tpl.selectList("categoryMapper.findAllTag");
	}

	public List<SmallCategory> findSmallCategoryByLno(long lno) {
		return tpl.selectList("categoryMapper.findSmallCategoryByLno", lno);
	}
}
