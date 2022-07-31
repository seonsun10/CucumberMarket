package com.cu.cum.product.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.product.model.dao.ProductDao;
import com.cu.cum.product.model.dao.ProductMapperDao;
import com.cu.cum.product.model.vo.Product;

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
	public int selectProductCount() {
		// TODO Auto-generated method stub
		return pmdao.selectProductCount(session);
	}
	
	@Override
	public List<Product> selectProductList(Map page) {
		// TODO Auto-generated method stub
		return pmdao.selectProductList(session, page);
	}

}
