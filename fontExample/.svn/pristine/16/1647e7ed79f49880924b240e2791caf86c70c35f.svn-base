package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class PaymentDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public int insert(Payment payment) {
		return tpl.insert("paymentMapper.insert",payment);
	}
	public List<Payment> findByPage(int startRowNum,int endRowNum){
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		return tpl.selectList("paymentMapper.findByPage",map);
	}
	public List<Payment> findByPageByUsername(int startRowNum,int endRowNum,String username){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRowNum", startRowNum);
		map.put("endRowNum", endRowNum);
		map.put("username",username);
		return tpl.selectList("paymentMapper.findByPage",map);
	}
	public int findCount() {
		return tpl.selectOne("paymentMapper.findCount");
	}
	public int findCountByUsername(String username) {
		return tpl.selectOne("paymentMapper.findCount",username);
	}
	public String findStatueByNo(long no) {
		return tpl.selectOne("paymentMapper.findStatueByNo",no);
	}
	public String findImpByNo(long no) {
		return tpl.selectOne("paymentMapper.findImpByNo",no);
	}
	public String findUsernameByNo(long no) {
		return tpl.selectOne("paymentMapper.findUsernameByNo",no);
	}
	public long findAmountByNo(long no) {
		return tpl.selectOne("paymentMapper.findAmountByNo",no);
	}
	public int updateStatue(long no,String statue) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("statue", statue);
		return tpl.update("paymentMapper.updateStatue",map);
	}
	public int delete(String imp_aid) {
		return tpl.delete("paymentMapper.delete",imp_aid);
	}
}
