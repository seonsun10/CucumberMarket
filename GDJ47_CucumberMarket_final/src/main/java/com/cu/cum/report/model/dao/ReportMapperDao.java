package com.cu.cum.report.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.cum.report.model.vo.Report;

@Repository
public class ReportMapperDao {
	
	// 신고 리스트 페이징 처리 
	
	public List<Report> selectReportList(SqlSessionTemplate session, Map param){
		int offset = (int)param.get("cPage");
		int limit = (int)param.get("numPerpage");
		return session.selectList("report.selectReportList",null,new RowBounds((offset-1)*limit,limit));
	}
	
	public int selectReportCount(SqlSessionTemplate session) {
		return session.selectOne("report.selectReportCount");
	}

}
