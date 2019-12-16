package com.icia.fontExample.Service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.entity.*;

@Service
public class RelatedProductsService {
	@Autowired
	private RelatedProductsDao dao;

	public List<Product> findRelatedProducts(long no) {
		return dao.findRelatedProducts(no);
	}

}
