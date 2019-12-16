package com.icia.fontExample.Service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.entity.*;

@Service
public class SellerService {
	@Autowired
	private SellerDao dao;
	
	public Seller findSeller(String username) {
		return dao.findSeller(username);
	}
	
	public Seller findSellerAll(String username) {
		return dao.findSellerAll(username);
	}
}
