package com.cu.cum.wishlist.model.dao;

import javax.transaction.Transactional;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.vo.Product;
import com.cu.cum.wishlist.model.vo.WishList;


public interface WishListDao extends JpaRepository<WishList, String>{
	

	WishList findByMemberAndProduct(Member m, Product p);
	
	WishList save(WishList wl);
	
	
	@Transactional
	@Query("delete from WishList where user_Id=:id and pro_No=:no")
	@Modifying
	int deleteWishList(@Param("id") String id,@Param("no") int no);
}
