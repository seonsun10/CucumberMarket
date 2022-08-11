package com.cu.cum.product.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.vo.Product;
import com.cu.cum.wishlist.model.vo.WishList;

public interface ProductWishListDao extends JpaRepository<WishList, String>{
	
	//관심상품
	WishList findByMemberAndProduct(Member m , Product p);

	WishList deleteByMemberAndProduct(Member m ,Product p);
}
