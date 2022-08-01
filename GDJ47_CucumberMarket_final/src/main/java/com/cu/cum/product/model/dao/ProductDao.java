package com.cu.cum.product.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.cu.cum.product.model.vo.Product;
import com.cu.cum.product.model.vo.Review;

public interface ProductDao extends JpaRepository<Product, Integer>{


	Product saveAndFlush(Product p);
	
//	//거래 후기
//	@Modifying
//	@Query("INSERT INTO REVIEW VALUES(:review.proNo,:review.oi,SYSDATE,:review.writer)")
//	Review save(Review review);
	
	//상품 삭제
	Product deleteById(int proNo);
	
	
}