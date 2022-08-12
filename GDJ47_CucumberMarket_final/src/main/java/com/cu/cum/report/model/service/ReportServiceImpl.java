package com.cu.cum.report.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.report.model.dao.ReportDao;
import com.cu.cum.report.model.vo.Report;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	// 신고글 작성
	@Override
	public Report insertReport(Report r) {
		// TODO Auto-generated method stub
		return dao.save(r);
	}

	@Override
	public List<Report> selectReportList(Map param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Report> searchReport(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

}
