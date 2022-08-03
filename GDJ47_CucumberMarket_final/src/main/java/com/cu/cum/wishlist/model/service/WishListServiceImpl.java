package com.cu.cum.wishlist.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.vo.Product;
import com.cu.cum.wishlist.model.dao.WishListDao;
import com.cu.cum.wishlist.model.vo.WishList;

@Service
public class WishListServiceImpl implements WishListService {

	@Autowired
	private WishListDao dao;
	
	@Override
	public WishList checkWishlist(Member m, Product p) {
		return dao.findByMemberAndProduct(m,p);
	}

	@Override
	public WishList insertWishlist(WishList wl) {
		return dao.save(wl);
	}
	
	@Override
	public int deleteWishlist(String id, int no) {
		return dao.deleteWishList(id,no);
	}


}