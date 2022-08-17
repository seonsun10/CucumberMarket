package com.cu.cum.product.model.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.vo.Files;
import com.cu.cum.product.model.vo.Product;

public interface FilesDao extends JpaRepository<Files, Integer>{

//	List<Files> save(List<Files> files); //insert update 둘다 하는 메소드
	
	@Query(value="select f from Files f where f.member=:m and f.thumbnailStatus='y'")
	List<Files> selectUserFiles(@Param("m") Member m);
	
	List<Files> findByProduct(Product p);//.builder.solveStatus('y')
	
	@Transactional
	@Modifying
	@Query(value="delete from Files where PRO_NO=:no")
	void deleteFile(int no);
}
