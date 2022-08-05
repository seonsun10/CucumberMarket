package com.cu.cum.product.model.service;

import java.util.List;

import java.util.Map;


import com.cu.cum.product.model.vo.Product;


import com.cu.cum.product.model.vo.Review;


public interface ProductService {

	Product insertProduct(Product p);
	
	//상품리스트 페이징처리 1-5
	List<Product> selectProductList(Map page);
	
	//상품 전체 수 조회
	int selectProductCount(String userId);
	
	//거래 후기 등록
	Product insertReview(Product p);
	
	//상품 조회
	Product selectProduct(int proNo);
	
	//상품 삭제
	Product deleteProduct(int proNo);
	
	//상품 리뷰 수 조회
	int selectReviewCount(String userId);
	
	//삼품 리뷰 조회
	List<Review> selectReviewList(Map page);
	
	//ㅉ목록
	List<Product> selectWishList(Map page);
	
	//ㅉ카운트
	int selectWishCount(String id);
	//방번호로 상품가져오기
	Product selectProduct(String roomId);
	//상품 판매상태 변경
	int updateProductSolve(int no);
	
}
