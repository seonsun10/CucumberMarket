package com.cu.cum.report.model.dao;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cu.cum.report.model.vo.Report;

@Repository
public interface ReportDao extends JpaRepository<Report, String>{

	// 신고글 작성 
	Report save(Report r);

	Report findByRepNo(int repNo);
	
	// 신고 글 제목으로 검색
	List<Report> findByrepTitleContaining(String keyword);
	
	// 신고 글 제목으로 검색
	List<Report> findByrepTypeContaining(String keyword);
	
}
