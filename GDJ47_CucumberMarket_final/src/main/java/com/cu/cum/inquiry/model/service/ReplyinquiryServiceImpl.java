package com.cu.cum.inquiry.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.inquiry.model.dao.InquiryMapperDao;
import com.cu.cum.inquiry.model.dao.ReplyInquiryDao;
import com.cu.cum.inquiry.model.vo.ReplyInquiry;


@Service
public class ReplyinquiryServiceImpl implements ReplyInquiryService {

	@Autowired
	private ReplyInquiryDao ridao;
	
	
	@Autowired
	private InquiryMapperDao imdao;
	
	
	@Autowired
	private SqlSessionTemplate session;
	
	// 문의 답글
	@Override
	public ReplyInquiry insertReply(ReplyInquiry r) {
		// TODO Auto-generated method stub
		return ridao.save(r);
		
	}
	
	// 글 번호로 불러오기
	@Override
	public ReplyInquiry selectReply(int replyinquiryNo) {
		// TODO Auto-generated method stub
		return ridao.findByreplyinquiryNo(replyinquiryNo);
	}

	// 문의 답글 수정
	@Override
	public int updateReply(ReplyInquiry r) {
		// TODO Auto-generated method stub
		return imdao.updateReply(session, r);
	}
	
	
	

}
