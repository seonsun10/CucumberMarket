package com.cu.cum.inquiry.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.cum.inquiry.model.vo.Inquiry;

@Repository
public class InquiryMapperDao {
	
	public List<Inquiry> selectInquiryListPage(SqlSessionTemplate session, Map param){
		int offset = (int)param.get("cPage");
		int limit = (int)param.get("numPerpage");
		return session.selectList("inquiry.selectInquiryList",null,new RowBounds((offset-1)*limit,limit));
	}
	
	public int selectInquiryCount(SqlSessionTemplate session) {
		return session.selectOne("inquiry.selectInquiryCount");
	}
	
	public int updateInquiry(SqlSessionTemplate session, Inquiry i) {
		
		return session.update("inquiry.updateInquiry", i);
	}

	
	public int deleteInquiry(SqlSessionTemplate session, int id) {
		return session.delete("inquiry.deleteInquiry",id);
	}
	

}
