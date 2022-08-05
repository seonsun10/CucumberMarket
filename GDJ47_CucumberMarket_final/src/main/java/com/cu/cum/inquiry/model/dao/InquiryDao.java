package com.cu.cum.inquiry.model.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.cu.cum.inquiry.model.vo.Inquiry;

@Repository
public interface InquiryDao extends JpaRepository<Inquiry, String>{
	
	Inquiry findByInquiryNo(int inquiryno);
	
	Inquiry save(Inquiry i);
	
	List<Inquiry> findAll();
	
	//@Query() // 제목으로 검색
	List<Inquiry> findByinquiryTitleContaining(String keyword);
	
	// 문의유형으로 검색
	List<Inquiry> findByInquiryTypeContaining(String keyword);
	//Inquiry deleteByInquiryNo(int inquiryNo);
	

}
