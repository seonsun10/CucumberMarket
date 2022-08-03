package com.cu.cum.test.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cu.cum.product.model.vo.Product;
@Repository
public interface TestDao extends JpaRepository<Product, Integer> {
	List<Product> findAll();
	Product findByProNo(int prono);
}
