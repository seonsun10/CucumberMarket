package com.cu.cum.report.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.report.model.dao.ReportDao;
import com.cu.cum.report.model.dao.ReportMapperDao;
import com.cu.cum.report.model.vo.Report;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportDao dao;
	
	@Autowired
	private ReportMapperDao rmdao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	// 신고글 작성
	@Override
	public Report insertReport(Report r) {
		// TODO Auto-generated method stub
		return dao.save(r);
	}
	// 신고글 페이징 처리
	@Override
	public List<Report> selectReportList(Map param) {
		// TODO Auto-generated method stub
		return rmdao.selectReportList(session, param);
	}

	// 신고글 검색
	@Override
	public List<Report> searchReport(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	// 신고글 갯수 
	@Override
	public int selectReportCount() {
		// TODO Auto-generated method stub
		return rmdao.selectReportCount(session);
	}
	
	// 신고글 상세정보
	@Override
	public Report selectReport(int repNo) {
		// TODO Auto-generated method stub
		return dao.findByRepNo(repNo);
	}
	
	// 신고글 삭제
	@Override
	public int deleteReport(int id) {
		// TODO Auto-generated method stub
		return rmdao.deleteReport(session, id);
	}
	
	// 신고글 제목으로 검색
	@Override
	public List<Report> searchReportTitle(String keyword) {
		// TODO Auto-generated method stub
		return dao.findByrepTitleContaining(keyword);
	}
	
	// 신고글 사유로 검색
	@Override
	public List<Report> searchReportType(String keyword) {
		// TODO Auto-generated method stub
		return dao.findByrepTypeContaining(keyword);
	}
	
	
	
	

	
}
