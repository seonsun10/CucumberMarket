package com.cu.cum.wishlist.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.vo.Product;
import com.cu.cum.wishlist.model.vo.WishList;


public interface WishListDao extends JpaRepository<WishList, String>{
	

	WishList findByMemberAndProduct(Member m, Product p);
}
