package com.cu.cum.inquiry.model.service;

import java.util.List;
import java.util.Map;

import com.cu.cum.inquiry.model.vo.Inquiry;

public interface InquiryService {

	List<Inquiry> selectInquiryList();
	
	List<Inquiry> selectBoardListPage(Map param);
	
	Inquiry selectInquiry(int inquiryno);
	
	Inquiry insertInquiry(Inquiry i);
	
	int deleteInquiry(Inquiry i);
	
	int updateInquiry(Inquiry i);
	
}
