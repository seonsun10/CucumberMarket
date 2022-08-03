package com.cu.cum.product.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cu.cum.product.model.vo.Files;

public interface FilesService {

	List<Files> insertFiles(List<Files> files);

}
