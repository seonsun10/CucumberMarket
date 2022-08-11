package com.cu.cum.wishlist.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.vo.Product;
import com.cu.cum.wishlist.model.vo.WishList;

public interface WishListService {
	
	
	
	WishList insertWishlist(WishList wl);
	
	int deleteWishlist(String id, int no);
	
	int checkidWishlist(SqlSessionTemplate session,WishList wl);
	
	//찜 객체 조회
	WishList findByWishId(int wishNo);
	
	//찜 목록 조회
	List<WishList> selectWishList(Member m);
	
	//찜 선택 삭제
	void deleteWishListAll(List<WishList> dibsList);

	WishList checkWishlist(Member m, Product p);
	
	

}
