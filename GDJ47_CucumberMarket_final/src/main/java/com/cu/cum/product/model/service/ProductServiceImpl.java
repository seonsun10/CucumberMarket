package com.cu.cum.product.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.product.model.dao.FilesDao;
import com.cu.cum.product.model.dao.ProductDao;
import com.cu.cum.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao dao;
	
//	@Autowired
//	private SqlSessionTemplate session;
	
	@Override
	public Product insertProduct(Product p) {
		Product result = dao.saveAndFlush(p);
		return result;
	}
	
}
