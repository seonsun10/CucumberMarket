package com.cu.cum.product.model.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.vo.Product;
import com.cu.cum.wishlist.model.vo.WishList;


public interface ProductDao extends JpaRepository<Product,Integer>,
	PagingAndSortingRepository<Product, Integer>{

//	@Query(value="select p from Product p left join p.files where p.member=:m")
//	List<Product> findAllByMember(@Param("m") Member m);
	
	@Query(value="select p from Product p left join p.files where p.solveStatus='y'")
	Page<Product> findAll(Pageable p);
	
	//@Query(value="select p from Product p where p.categoryName=:name and p.solveStatus='y'")
	Page<Product> findAllByCategoryNameAndSolveStatus(Pageable p, String categoryName, String solveStatus);
	
	Product saveAndFlush(Product p); //주객체 
	
	


	
//	//거래 후기
//	@Modifying
//	@Query("INSERT INTO REVIEW VALUES(:review.proNo,:review.oi,SYSDATE,:review.writer)")
//	Review save(Review review);
	
	//상품 삭제
	@Transactional
	List<Product> deleteById(int proNo);
	
	//후기 등록
	@Transactional
	Product save(Product p);
	
	//상품 조회
//	@Query(value="select p from Product p left join p.files where p.proNo=:proNo and p.solveStatus='y'")
	Product findById(int proNo);
	
	//jpa상품 페이징
	List<Product> findAllByMember(Pageable p, Member m);
	
}