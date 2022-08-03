package com.cu.cum.wishlist.model.service;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.vo.Product;
import com.cu.cum.wishlist.model.vo.WishList;

public interface WishListService {
	
	WishList checkWishlist(Member m, Product p);
	
	WishList insertWishlist(WishList wl);
	
	int deleteWishlist(String id, int no);

}
