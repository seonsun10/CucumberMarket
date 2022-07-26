package com.cu.cum.inquiry.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.cu.cum.inquiry.model.vo.Inquiry;
import com.cu.cum.inquiry.model.vo.ReplyInquiry;

public interface InquiryService {
	
	// 문의글 목록
	List<Inquiry> selectInquiryList();
	
	// 문의글 목록 페이징
	List<Inquiry> selectInquiryListPage(Map param);
	
	// 문의 글 개수
	int selectInquiryCount();
	
	// 문의 글 상세정보
	Inquiry selectInquiry(int inquiryno); 
	
	// 문의 글 작성
	Inquiry insertInquiry(Inquiry i);
	
	// 문의 글 삭제
	int deleteInquiry(int id);
	//Inquiry deleteInquiry(int inquiryNo);
	
	// 문의 글 수정
	int updateInquiry(Inquiry i);
	
	// 문의 글 상세페이지 수정 전 내용 불러오기 
	
	Inquiry findByInquiryNo(int inquiryNo);
	
	// 문의 글 검색
	List<Inquiry> searchList(String keyword);
	
	List<Inquiry> searchListType(String keyword);
	//List<Inquiry> searchListTest(String keyword, Pageable pageable);
	
	// 답변달린문의글 삭제 불가 구현
	
	List<Inquiry> joinInquiryN(int inquiryNo);
	
	
	
}
