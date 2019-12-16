package com.icia.fontExample.Service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.security.crypto.password.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.entity.*;

@Service
public class CertificationService {
	@Autowired
	private CertificationDao dao;

	public Certification certification_find(String username) {
		return dao.certification_find(username);
	}

	public int email_Certification(String username) {
		return dao.email_Certification(username);
	}
	
	public int tel_Certification(String username) {
		return dao.tel_Certification(username);
	}
}
