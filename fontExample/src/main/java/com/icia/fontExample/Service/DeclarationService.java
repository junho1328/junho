package com.icia.fontExample.Service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.date.dto.*;
import com.icia.fontExample.entity.*;

@Service
public class DeclarationService {
	@Autowired
	private DeclarationDao dao;
	
	public int declaration(String reason) {
		return dao.update(reason); 
	}
	public int insert(Declaration declaration) {
		declaration.getReason_no(); // declaration에서 신고 사유 번호를 빼온다 
		return dao.insert(declaration);
	}
	public List<Declaration> declarationList(){
		return dao.findAll();
	}
	public DeclarationPage findByPage(int pageno, int pagesize) {
		int count = dao.findCount();
		//	pageno	pagesize	startRowNum		endRowNum
		// 		1 		10			0				10
		// 		2 		10			11				20
		int startRowNum = ((pageno-1) * pagesize + 1);
		int endRowNum = startRowNum + pagesize -1;
		if(endRowNum >= count)
			endRowNum = count;
		List<Declaration> declaration = dao.findByPage(startRowNum, endRowNum);
		return new DeclarationPage().builder().pageno(pageno).pagesize(pagesize).totalcount(count).declarationPage(declaration).build();
	}
	// 신고 번호를 받는다
	public Declaration detailView(long no) {
		return dao.detailView(no); // 신고 번호를 넘겨줌
	}
}

