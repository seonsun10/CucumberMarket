package com.cu.cum.inquiry.model.service;

import com.cu.cum.inquiry.model.vo.ReplyInquiry;

public interface ReplyInquiryService {

	
	// 문의답글 작성 
	ReplyInquiry insertReply(ReplyInquiry r);
	
	// 문의 답글 상세정보
	ReplyInquiry selectReply(int replyInquiryNo);
	
	// 문의 답글 수정
	int updateReply(ReplyInquiry r);
}
