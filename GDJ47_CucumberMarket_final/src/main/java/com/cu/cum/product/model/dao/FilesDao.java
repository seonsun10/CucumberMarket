package com.cu.cum.product.model.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.data.jpa.repository.JpaRepository;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.vo.Files;

public interface FilesDao extends JpaRepository<Files, Integer>{

	List<Files> save(List<Files> files);
	
	@Query(value="select f from Files f where f.member=:m and f.thumbnailStatus='y'")
	List<Files> selectUserFiles(@Param("m") Member m);

}
