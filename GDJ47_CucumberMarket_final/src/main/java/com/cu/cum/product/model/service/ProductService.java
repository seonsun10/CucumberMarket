package com.cu.cum.product.model.service;


import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Pageable;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.vo.Files;
import com.cu.cum.product.model.vo.Product;
import com.cu.cum.product.model.vo.Review;
import com.cu.cum.wishlist.model.vo.WishList;


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
	List<Product> deleteProduct(int proNo);
	
	//상품 리뷰 수 조회
	int selectReviewCount(String userId);
	
	//삼품 리뷰 조회
	List<Review> selectReviewList(Map page);

	//유저가 가지고 있는 상품 조회
	List<Product> selectUserProductList(Map page, String userId);
	
	//ㅉ목록
	List<Product> selectWishList(Map page);
	
	//ㅉ카운트
	int selectWishCount(String id);
	//방번호로 상품가져오기
	Product selectProduct(String roomId);
	//상품 판매상태 변경
	int updateProductSolve(int no);
	//판매완료상품개수
	int selectSolveCount(String userId);

	
	//메인페이지에 추천상품 리스트
	List<Product> mainProductList();
	//추천상품 이미지
//	List<Files> mainFilesList();
	
	//jpa페이징
	List<Product> findAllByCategoryName(Pageable p, String tag);
	
	//카테고리 상품 개수
	int selectCategoryCount(String tag);

	WishList checkWishlist(Member m, Product p);

	Product productCheck(int no);

	List<Product> relProduct(Map param);


	List<Files> selectFiles(Product p);
	
	//상품 검색
	List<Product> searchProduct(String keyword);
	
	//userId로 상품 출력 jpa페이징
	List<Product> findAllByMember(Pageable p, Member m);
	
	//상품 조회수
	int productViewCountUp(int no);
}
