package com.cu.cum.inquiry.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.inquiry.model.dao.ReplyInquiryDao;
import com.cu.cum.inquiry.model.vo.ReplyInquiry;


@Service
public class ReplyinquiryServiceImpl implements ReplyInquiryService {

	@Autowired
	private ReplyInquiryDao ridao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	// 문의 답글
	@Override
	public ReplyInquiry insertReply(ReplyInquiry r) {
		// TODO Auto-generated method stub
		return ridao.save(r);
		
	}

}
