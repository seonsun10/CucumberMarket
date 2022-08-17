package com.cu.cum.product.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.product.model.dao.FilesDao;
import com.cu.cum.product.model.vo.Files;
import com.cu.cum.product.model.vo.Product;

@Service
public class FilesServiceImpl implements FilesService {
	@PersistenceContext
	EntityManager em;
	@Autowired
	private FilesDao fdao;


	public List<Files> insertFiles(List<Files> files) {
		List<Files> result=new ArrayList();
		for(Files f : files) {
			result.add(fdao.save(f));
		}
		return result;
	}


	@Override
	public void deleteFile(int no) {
		fdao.deleteFile(no);
		fdao.flush();
		em.clear();
		
	}


	@Override
	public List<Files> findByProduct(Product p) {
		
		return fdao.findByProduct(p);
	}

}
