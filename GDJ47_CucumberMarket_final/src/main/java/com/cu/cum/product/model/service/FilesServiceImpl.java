package com.cu.cum.product.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.product.model.dao.FilesDao;
import com.cu.cum.product.model.vo.Files;

@Service
public class FilesServiceImpl implements FilesService {

	@Autowired
	private FilesDao fdao;


	public List<Files> insertFiles(List<Files> files) {
		List<Files> result=new ArrayList();
		for(Files f : files) {
			result.add(fdao.save(f));
		}
		
		return result;
	}

}
