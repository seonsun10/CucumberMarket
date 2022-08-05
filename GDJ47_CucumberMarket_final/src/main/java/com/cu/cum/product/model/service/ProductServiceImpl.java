package com.cu.cum.product.model.service;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.cu.cum.product.model.dao.FilesDao;

import com.cu.cum.product.model.dao.ProductDao;
import com.cu.cum.product.model.dao.ProductMapperDao;
import com.cu.cum.product.model.vo.Product;

import com.cu.cum.product.model.vo.Review;


@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao dao;
	

	@Autowired
	private ProductMapperDao pmdao;
	
	
	@Autowired
	private SqlSessionTemplate session;

	
	@Override
	public Product insertProduct(Product p) {
		Product result = dao.saveAndFlush(p);
		return result;
	}
	

	@Override
	public int selectProductCount(String userId) {
		// TODO Auto-generated method stub
		return pmdao.selectProductCount(session, userId);
	}
	
	@Override
	public List<Product> selectProductList(Map page) {
		// TODO Auto-generated method stub
		return pmdao.selectProductList(session, page);
	}
	
	//거래후기
	@Override
	public Product insertReview(Product p) {
		// TODO Auto-generated method stub
		return dao.save(p);
	}
	
	//상품 조회
	@Override
	public Product selectProduct(int proNo) {
		// TODO Auto-generated method stub
		return dao.findById(proNo);
	}
	
	//상품 삭제
	@Override
	public Product deleteProduct(int proNo) {
		// TODO Auto-generated method stub
		return dao.deleteById(proNo);
		
	}
	
	//리뷰 수 조회
	@Override
	public int selectReviewCount(String userId) {
		// TODO Auto-generated method stub
		return pmdao.selectReviewCount(session, userId);
	}
	
	//상품 리뷰 리스트 조회
	public List<Review> selectReviewList(Map map){
		return pmdao.selectReviewList(session, map);
	}
	//ㅉ리스트
	public List<Product> selectWishList(Map map){
		return pmdao.selectWishList(session, map);
	}
	//ㅉ카운트
	public int selectWishCount(String id) {
		return pmdao.selectWishCount(session, id);
	}
	
	
}
