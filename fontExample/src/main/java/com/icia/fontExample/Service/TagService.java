package com.icia.fontExample.Service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.entity.*;

@Service
public class TagService {
	@Autowired
	private TagDao dao;

	public List<Tag> findHotTag() {
		return dao.findHotTag();
	}
//	public int makeHotTag(long productNo) {
//		return dao.makeHotTag(productNo);
//	}
}
