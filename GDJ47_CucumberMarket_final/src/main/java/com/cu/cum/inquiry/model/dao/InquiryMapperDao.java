package com.cu.cum.inquiry.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.cum.inquiry.model.vo.Inquiry;
import com.cu.cum.inquiry.model.vo.ReplyInquiry;

@Repository
public class InquiryMapperDao {
	
	// 문의 리스트 페이징 처리
	public List<Inquiry> selectInquiryListPage(SqlSessionTemplate session, Map param){
		int offset = (int)param.get("cPage");
		int limit = (int)param.get("numPerpage");
		return session.selectList("inquiry.selectInquiryList",null,new RowBounds((offset-1)*limit,limit));
	}
	
	public int selectInquiryCount(SqlSessionTemplate session) {
		return session.selectOne("inquiry.selectInquiryCount");
	}
	
	// 문의글 수정
	public int updateInquiry(SqlSessionTemplate session, Inquiry i) {
		
		return session.update("inquiry.updateInquiry", i);
	}

	// 문의글 삭제
	public int deleteInquiry(SqlSessionTemplate session, int id) {
		return session.delete("inquiry.deleteInquiry",id);
	}
	
	// 문의답글 수정
	public int updateReply(SqlSessionTemplate session, ReplyInquiry r) {
		return session.update("inquiry.updateReply",r);
	}

}
