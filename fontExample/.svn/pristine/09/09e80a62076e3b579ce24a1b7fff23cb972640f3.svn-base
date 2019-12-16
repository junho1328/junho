package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class PurchaseDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public int insert(Purchase purchase) {
		return tpl.insert("purchaseMapper.insert",purchase);
	}

	public long findPurchaseNo(Purchase purchase) {
		return tpl.selectOne("purchaseMapper.findPurchaseNo", purchase);
	}

	public int conutByState(String username) {
		return tpl.selectOne("purchaseMapper.conutByPurchase",username);
	}
	public List<Purchase> findPurchaseBuyer(String username,int startRowNum,int endRowNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return tpl.selectList("purchaseMapper.findPurchaseBuyer", map);
	}
	public List<Purchase> findPurchaseSeller(String username,int startRowNum,int endRowNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("username", username);
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return tpl.selectList("purchaseMapper.findPurchaseSeller", map);
	}
	public int updateState(long no) {
		return tpl.update("purchaseMapper.updatestate",no);
	}
	public Purchase findPurchaseByNo(long no) {
		return tpl.selectOne("purchaseMapper.findPurchaseByNo", no);
	}
	
	public int delete(long no) {
		return tpl.delete("purchaseMapper.delete",no);
	}
}
