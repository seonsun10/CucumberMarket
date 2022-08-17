package com.cu.cum.product.model.service;

import java.util.List;

import com.cu.cum.product.model.vo.Files;
import com.cu.cum.product.model.vo.Product;

public interface FilesService {

	List<Files> insertFiles(List<Files> files);

	void deleteFile(int no);

	List<Files> findByProduct(Product p);
}
