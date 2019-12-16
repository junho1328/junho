package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class RelatedProductsDao {
	@Autowired
	private SqlSessionTemplate tpl;

	public List<Product> findRelatedProducts(long no) {
		return tpl.selectList("relatedProductsMapper.findRelatedProducts", no);
	}

}
