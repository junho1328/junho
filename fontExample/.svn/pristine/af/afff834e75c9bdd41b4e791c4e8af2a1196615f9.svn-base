package com.icia.fontExample.Service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.entity.*;


@Service
public class CategoryService {
	@Autowired
	private CategoryDao dao;
	
	public List<LargeCategory> findAllLargeCategory() {
		return dao.findAllLargeCategory();
	}

	public List<SmallCategory> findAllSmallCategory() {
		return dao.findAllSmallCategory();
	}

	public List<Map> findAllTag() {
		return dao.findAllTag();
	}

	public List<SmallCategory> findSmallCategoryByLno(long lno) {
		return dao.findSmallCategoryByLno(lno);
	}
}
