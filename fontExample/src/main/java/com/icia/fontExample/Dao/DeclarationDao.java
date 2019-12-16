package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class DeclarationDao {
	@Autowired
	private SqlSessionTemplate tpl; 
	
	public int update(String reason) {
		return tpl.update("declarationMapper.declarationUpdate",reason);
	}
	public int insert(Declaration declaration){
		return tpl.insert("declarationMapper.insert",declaration); 
	
	}
	public List<Declaration> findAll(){
		return tpl.selectList("declarationMapper.declarationView");
	}
	public int findCount() {
		return tpl.selectOne("declarationMapper.findCount");
	}
	public List<Declaration> findByPage(int startRowNum, int endRowNum){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRowNum",startRowNum);
		map.put("endRowNum",endRowNum);
		return tpl.selectList("declarationMapper.declarationByPage",map);
	}
	public Declaration detailView(long no) {
		return tpl.selectOne("declarationMapper.detailView",no); 
	}
	
}
