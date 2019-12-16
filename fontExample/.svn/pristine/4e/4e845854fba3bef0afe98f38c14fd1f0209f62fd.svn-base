package com.icia.fontExample.Service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.date.dto.*;
import com.icia.fontExample.entity.*;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao dao;
	
	public long insert(Notice notice) {
		dao.insert(notice);
		return notice.getNo();
	}

	public Notice noticeByNo(Long no) {
		return dao.noticeByNo(no);
	}

	public NoticePage noticeAllRead(int pageno, int pagesize) {
		int count = dao.findCount();
		//	pageno	pagesize	startRowNum		endRowNum
		// 		1 		10			0				10
		// 		2 		10			11				20
		int startRowNum = ((pageno-1) * pagesize + 1);
		int endRowNum = startRowNum + pagesize -1;
		if(endRowNum >= count)
			endRowNum = count;
		List<Notice> notice = dao.findByPage(startRowNum, endRowNum);
		return new NoticePage().builder().pageno(pageno).pagesize(pagesize).totalcount(count).noticePage(notice).build();
	}

	public long update(Notice notice) {
		dao.update(notice);
		return notice.getNo();
	}
}
