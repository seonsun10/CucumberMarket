package com.cu.cum.product.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		return dao.save(p);
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
	public int insertReview(Review review) {
		// TODO Auto-generated method stub
		return pmdao.insertReview(session, review);
	}
	
	//상품 조회
	@Override
	public Product selectProduct(int proNo) {
		// TODO Auto-generated method stub
		return pmdao.selectProduct(session, proNo);
	}
	
	//상품 삭제
	@Override
	public Product deleteProduct(int proNo) {
		// TODO Auto-generated method stub
		return dao.deleteById(proNo);
	}

}
