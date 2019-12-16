package com.icia.fontExample.Service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.entity.*;

@Service
public class InquiryAnswerService {
	@Autowired
	private InquiryAnswerDao dao;
	
	public long answerInsert(Inquiry inquiry) {
		dao.answerInsert(inquiry);
		return inquiry.getNo();
	}

	public Inquiry answerFind(int no) {
		return dao.answerFind(no);
	}
}
