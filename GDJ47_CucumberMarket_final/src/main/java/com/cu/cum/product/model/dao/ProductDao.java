package com.cu.cum.product.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.data.jpa.repository.JpaRepository;

import com.cu.cum.product.model.vo.Product;

public interface ProductDao extends JpaRepository<Product,String>{


	Product saveAndFlush(Product p); //주객체 
	

}