package com.icia.fontExample.Dao;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class InquiryAnswerDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public int answerInsert(Inquiry inquiry) {
		return tpl.update("inquiryMapper.answerInsert",inquiry);
	}
	public Inquiry answerFind(int no) {
		return tpl.selectOne("inquiryMapper.answerFind",no);
	}
}
