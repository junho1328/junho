package com.icia.fontExample.Service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;

@Service
public class WithdrawalService {
	@Autowired
	private WithdrawalDao dao;
	@Autowired
	private AuthorityDao authoritydao;
	@Autowired
	private SalesRightsDao SalesRightsdao;
	public int withdrawal(String username, String reason, String reason_detail) {
		dao.insert(reason_detail);
		dao.update(reason);
		SalesRightsdao.delete(username);
		authoritydao.delete(username);
		return dao.delete(username);
	}
}
