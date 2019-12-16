package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class NoticeDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public int insert(Notice notice) {
		return tpl.insert("noticeMapper.insert", notice);
	}

	public Notice noticeByNo(Long no) {
		return tpl.selectOne("noticeMapper.noticeByNo", no);
	}
	
	public int findCount() {
		// TODO Auto-generated method stub
		return tpl.selectOne("noticeMapper.findCount");
	}

	public List<Notice> findByPage(int startRowNum, int endRowNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRowNum",startRowNum);
		map.put("endRowNum",endRowNum);
		return tpl.selectList("noticeMapper.noticeByPage",map);
	}

	public int update(Notice notice) {
		return tpl.insert("noticeMapper.update", notice);
	}
}
