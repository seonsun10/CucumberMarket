package com.cu.cum.product.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cu.cum.product.model.vo.Review;

public interface ReviewDao extends JpaRepository<Review,Integer>{
	Review save(Review rv);
}
