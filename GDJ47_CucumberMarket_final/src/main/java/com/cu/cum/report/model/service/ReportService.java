package com.cu.cum.report.model.service;

import java.util.List;
import java.util.Map;

import com.cu.cum.report.model.vo.Report;

public interface ReportService {

	// 신고글 작성
	Report insertReport(Report r);
	
	
	
	// 신고글 수정 -> 수정불가로 결정(허위로 신고하면 허위신고자 계정 삭제)
	
	
	
	// 신고글 전체 조회
	List<Report> selectReportList(Map param);  // 페이징 포함
	
	
	
	// 신고글(작성자)로 검색
	List<Report> searchReport(String keyword);
	
	
	
}