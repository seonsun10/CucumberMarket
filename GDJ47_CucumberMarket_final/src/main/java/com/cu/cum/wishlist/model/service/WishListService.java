package com.cu.cum.wishlist.model.service;

import org.mybatis.spring.SqlSessionTemplate;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.vo.Product;
import com.cu.cum.wishlist.model.vo.WishList;

public interface WishListService {
	
	
	
	WishList insertWishlist(WishList wl);
	
	int deleteWishlist(String id, int no);
	
	int checkidWishlist(SqlSessionTemplate session,WishList wl);

}
