package com.cu.cum.wishlist.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.cu.cum.wishlist.model.vo.WishList;

@Mapper
public interface WishMapper {

	@Select("select * from wish_list where user_id=#{userId}")
	List<WishList> selectWishList(String userId);
	
	@Select("select count(*) from wish_list where user_id=#{userId}")
	int selectWishListNum(String userId);
}
