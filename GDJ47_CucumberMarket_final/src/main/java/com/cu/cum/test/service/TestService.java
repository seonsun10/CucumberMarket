package com.cu.cum.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.product.model.vo.Product;
import com.cu.cum.test.dao.TestDao;

@Service
public class TestService {
	@Autowired
	private TestDao dao;
	
	public List<Product> findAll(){
		return dao.findAll();
	}
	public Product selectproduct(int id) {
		return dao.findByProNo(id);
	}
}
