package com.cu.cum.inquiry.model.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cu.cum.inquiry.model.vo.Inquiry;

@Repository
public interface InquiryDao extends JpaRepository<Inquiry, String>{
	
	Inquiry findByInquiryNo(int inquiryno);
	
	Inquiry save(Inquiry i);
	
	List<Inquiry> findAll();
	
	List<Inquiry> findByinquiryTitleContaining(String keyword);
	
	//Inquiry deleteByInquiryNo(int inquiryNo);
	

}
