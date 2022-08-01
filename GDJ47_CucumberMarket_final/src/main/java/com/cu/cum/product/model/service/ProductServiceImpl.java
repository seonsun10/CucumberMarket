package com.cu.cum.product.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.dao.ProductDao;
import com.cu.cum.product.model.vo.Product;
import com.cu.cum.wishlist.model.vo.WishList;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao dao;
	
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public Product insertProduct(Product p) {
		return dao.save(p);
	}


}
