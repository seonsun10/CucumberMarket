package com.cu.cum.product.model.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.cu.cum.product.model.vo.Product;


public interface ProductDao extends JpaRepository<Product,Integer>,
	PagingAndSortingRepository<Product, Integer>{

//	@Query(value="select p from Product p left join p.files where p.member=:m")
//	List<Product> findAllByMember(@Param("m") Member m);
	
	@Query(value="select p from Product p left join p.files")
	Page<Product> findAll(Pageable p);
	
//	@Query(value="select p from Product p left join p.files where p.categoryName=$:1")
	Page<Product> findAllByCategoryName(Pageable p, String name);
	
	Product saveAndFlush(Product p); //주객체 
	


	
//	//거래 후기
//	@Modifying
//	@Query("INSERT INTO REVIEW VALUES(:review.proNo,:review.oi,SYSDATE,:review.writer)")
//	Review save(Review review);
	
	//상품 삭제
	@Transactional
	Product deleteById(int proNo);
	
	//후기 등록
	@Transactional
	Product save(Product p);
	
	//상품 조회
	Product findById(int proNo);
	

}