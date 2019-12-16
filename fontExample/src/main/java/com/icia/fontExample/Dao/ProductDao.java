package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class ProductDao {

	@Autowired
	private SqlSessionTemplate tpl;
	public int insert(Product product) {
		return tpl.insert("productMapper.insert",product);
	}
	public int tagInsert(Tag tag) {
		return tpl.insert("tagMapper.insert", tag);
	}
	public List<Product> findAllProduct() {
		return tpl.selectOne("productMapper.findAllProduct");
	}
	public Product findProduct(long no) {
		return tpl.selectOne("productMapper.findProduct",no);
	}
	public long findPriceByProduct(long no) {
		return tpl.selectOne("productMapper.findPriceByProduct",no);
	}
	public int findQuantityByProduct(long no) {
		return tpl.selectOne("productMapper.findQuantityByProduct",no);
	}
	public int updateQuantity(long no,int quantity) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("no",no);
		map.put("quantity",quantity);
		return tpl.update("productMapper.updateQuantity",map);
	}
	public int updateStateWhereSoldOut(long no) {
		return tpl.update("productMapper.updateStateWhereSoldOut",no);
	}
	public int delete(long no) {
		return tpl.delete("productMapper.delete", no);
	}
}
