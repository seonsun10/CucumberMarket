package com.cu.cum.test.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.product.model.dao.ProductMapperDao;
import com.cu.cum.product.model.vo.Product;
import com.cu.cum.test.dao.TestDao;

@Service
public class TestService {
	@Autowired
	private ProductMapperDao dao;
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private TestDao dao2;
	
	public List<Product> findAll(){
		return dao.selectall(session);
	}
	public Product selectproduct(int id) {
		return dao.selectProduct(session,id);
	}
}
