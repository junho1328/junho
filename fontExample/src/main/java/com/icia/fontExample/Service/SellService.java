package com.icia.fontExample.Service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.entity.*;

@Service
public class SellService {
	@Autowired
	private SellDao dao;
	
	public int insert(Sell sell) {
		return dao.insert(sell);
	}

	public List<Sell> findAllSell() {
		return dao.findAllSell();
	}

	public List<Sell> findSell(long no) {
		return dao.findSell(no);
	}
	public int hide(long no,long block) {
		
		return dao.hide(no,block);
		
	}
	public int unHide(long no) {
		return dao.unHide(no);
	}
	public List<Sell> checkHide(List listNo){
		return dao.checkHide();
	}
	public List<Sell> checkUnHide(List listNo){
		return dao.checkUnHide();
	}
	public List<Sell> chedckDelete(List listNo){
		return dao.checkDelete();
	}
	public void delete(long no) {
		dao.delete(no);
	}

	public String findSellerByNo(long no) {
		return dao.findSellerByNo(no);
	}
	
	public Object findAllSalesArtice(int pageno) {
	
		return dao.findAllSalesArtice(pageno);
	}

	public Object findAllSalesArticeByWriter(int pageno, String writer) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object deleteSalesArtice(long no, String name) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object deleteByCheck(List  listNo, String name) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object hideSalesArtice(long bno, String name) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object unHideSalesArtice(long bno, String name) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object hideByCheck(List bno, String name) {
		// TODO Auto-generated method stub
		return null;
	}

	public Object unHideByCheck(List bno, String name) {
		return null;
	}
	public String findUsername(long no) {
		return dao.findUsername(no);
	}

	public Object newFindAllSalesArtice(int no, int block) {
		
		return dao.newFindAllSalesArtice(no,block);
	}

	
}
