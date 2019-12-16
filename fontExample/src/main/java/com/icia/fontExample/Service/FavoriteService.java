package com.icia.fontExample.Service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.icia.fontExample.Dao.*;
import com.icia.fontExample.entity.*;

@Service
public class FavoriteService {
	@Autowired
	private FavoriteDao dao;
	
	public String insert(String username,long productNo) {
		long favoriteAlreadyExist = dao.findFavoriteByPno(username,productNo);
		int favoriteCount = dao.favoriteCount(username);
		if(favoriteCount>10) {
			return "즐겨찾기가 꽉 찼습니다.";
		}
		if(favoriteAlreadyExist>0) {
			return "해당 상품이 이미 존재합니다.";
		}
		dao.insertFavorite(username, productNo);
		return "즐겨찾기 등록이 완료되었습니다.";
	}
	public List<Favorite> findFavorite(String username) {
		List<Integer> listOfFavorite = dao.findFavorite(username);
		ArrayList<Favorite> favorite = new ArrayList<Favorite>();
		for(Integer no:listOfFavorite) {
			favorite.add(dao.findProductByFavorite(username,no));
		}
		System.out.println(favorite);
		return favorite;
	}
	public String delete(List<Integer> list) {
		for(Integer no:list)
			dao.delete(no);
		return "삭제가 완료되었습니다.";
	}
	public String deleteBySoldout(String username) {
		List<Integer> listOfFavorite = dao.findFavorite(username);
		ArrayList<Integer> list = new ArrayList<Integer>();
		for(Integer isSO:listOfFavorite) {
			if(dao.findProductBySoldOut(isSO)==1) {
				list.add(isSO);
			}
		}
		System.out.println(list);
		for(Integer no:list)
			dao.delete(no);
		return "판매가 완료된 상품이 삭제되었습니다.";
	}
}
