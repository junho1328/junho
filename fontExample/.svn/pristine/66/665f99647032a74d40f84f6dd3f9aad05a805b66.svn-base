package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class CertificationDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public int certification_Insert(String username) {
		return tpl.insert("certificationMapper.certification_insert", username);
	}
	public Certification certification_find(String username) {
		return tpl.selectOne("certificationMapper.certification_find", username);
	}

	public int email_Certification(String username) {
		return tpl.update("certificationMapper.email_certification", username);
	}
	
	public int tel_Certification(String username) {
		return tpl.update("certificationMapper.tel_certification", username);
	}
}
