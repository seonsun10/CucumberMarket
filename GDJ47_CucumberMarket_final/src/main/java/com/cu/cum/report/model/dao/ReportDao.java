package com.cu.cum.report.model.dao;

import org.springframework.stereotype.Repository;

import com.cu.cum.report.model.vo.Report;

@Repository
public interface ReportDao {

	// 신고글 작성 
	Report save(Report r);

	
}
