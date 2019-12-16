package com.icia.fontExample.Service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;

@Service
public class JoinService {
	@Autowired
	private JoinDao dao;

	public boolean checkId(String username) {
		return dao.checkId(username)==null;
	}

	public boolean checkEmail(String email) {
		return dao.checkEmail(email)==null; 
	}

}
