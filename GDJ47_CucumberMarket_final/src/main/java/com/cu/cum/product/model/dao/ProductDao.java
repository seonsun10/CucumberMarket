package com.cu.cum.product.model.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.cu.cum.product.model.vo.Product;

public interface ProductDao extends JpaRepository<Product, String>{


	Product saveAndFlush(Product p);
	

}