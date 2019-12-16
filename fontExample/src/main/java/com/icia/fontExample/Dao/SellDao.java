package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class SellDao {
	
	@Autowired
	private SqlSessionTemplate tpl;
	public int insert(Sell sell) {
		return tpl.insert("sellMapper.insert",sell);
	}
	public List<Sell> findAllSell(){
		return tpl.selectList("sellMapper.findAllSell");
	}
	
	public List<Sell> findSell(long no){
		return tpl.selectList("sellMapper.findSell",no);
	}
	
	public int hide(long no, long block) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("no", no);
		map.put("block", block);
		return tpl.update("productMapper.hide",map);
	}
	public int unHide(long no) {
		return tpl.update("productMapper.unhide",no);
	}
	public int delete(long no) {
		return tpl.delete("productMapper.delete", no);
	}
	public List<Sell> checkHide(){
		return null;
		//return tpl.update("productMapper.checkHide", parameter);
	}
	public List<Sell> checkUnHide(){
		return null;
		//return tpl.update("productMapper.checkUnHide", parameter);
	}
	public List<Sell> checkDelete(){
		return null;
		//return tpl.delete("productMapper.checkDelete", parameter);
	}
	public List<Sell> findAllSalesArtice(int pageno) {
		return tpl.selectList("sellMapper.findAllSalesArtice");
	}
	public String findSellerByNo(long no) {
		return tpl.selectOne("sellMapper.findSellerByNo", no);
	}
	
	public Object newFindAllSalesArtice(int no, int block) {
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("no", no);
		map.put("block", block);
		return tpl.update("productMapper.hide",map);
	}
	public String findUsername(long no) {
		return tpl.selectOne("sellMapper.findUsername",no);
	}
	

}
