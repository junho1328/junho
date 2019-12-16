package com.icia.fontExample.Dao;

import java.util.*;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class WaitingPointDao {
	@Autowired
	private SqlSessionTemplate tpl;
	
	public int insert(WaitingPoint waitingPoint) {
		return tpl.insert("waitingPointMapper.insert",waitingPoint);
	}
	public WaitingPoint findByNo(long no){
		return tpl.selectOne("waitingPointMapper.findByNo",no);
	}
	public int delete(long no) {
		return tpl.delete("waitingPointMapper.delete",no);
	}
}
