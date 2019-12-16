package com.icia.fontExample.Dao;

import org.mybatis.spring.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.entity.*;

@Repository
public class SellerReviewDao {
	@Autowired
	private SqlSessionTemplate tpl;

//	public int insertSR(SellerReview sellerReview) {
//		return tpl.insert("sellerReviewMapper.insertSR", sellerReview);
//	}
	
	public int insert(SellerReview seller_review) {
		return tpl.insert("sellerReviewMapper.insert", seller_review);
	}
	
//	public int updateTrustUp(long no) {
//		return tpl.update("sellerReviewMapper.updateTrustUp", no);
//	}
//	
//	public int updateTrustDown(long no) {
//		return tpl.update("sellerReviewMapper.updateTrustDown", no);
//	}
//
//	public int findTrustUpDownCnt(long no) {
//		return tpl.selectOne("sellerReviewMapper.findTrustUpDownCnt", no);
//	}

}
