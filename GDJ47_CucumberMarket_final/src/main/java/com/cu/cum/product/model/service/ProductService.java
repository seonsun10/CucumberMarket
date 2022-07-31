package com.cu.cum.product.model.service;

import java.util.List;
import java.util.Map;

import com.cu.cum.product.model.vo.Product;

public interface ProductService {

	Product insertProduct(Product p);
	
	//상품리스트 페이징처리 1-5
	List<Product> selectProductList(Map page);
	
	//상품 전체 수 조회
	int selectProductCount();
}
