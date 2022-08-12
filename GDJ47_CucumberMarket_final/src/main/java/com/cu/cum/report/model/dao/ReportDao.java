package com.cu.cum.report.model.dao;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cu.cum.report.model.vo.Report;

@Repository
public interface ReportDao extends JpaRepository<Report, String>{

	// 신고글 작성 
	Report save(Report r);

	Report findByRepNo(int repNo);
	
}
