package com.cu.cum.product.model.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cu.cum.product.model.vo.Files;

public interface FilesDao extends JpaRepository<Files, Integer>{

	List<Files> save(List<Files> files);
}
