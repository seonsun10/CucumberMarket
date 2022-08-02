package com.cu.cum.inquiry.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.inquiry.model.dao.InquiryDao;
import com.cu.cum.inquiry.model.vo.Inquiry;

@Service
public class InquiryServiceImpl implements InquiryService {
	
	@Autowired
	private InquiryDao dao;
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<Inquiry> selectInquiryList(){
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	@Override
	public List<Inquiry> selectBoardListPage(Map param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Inquiry selectInquiry(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	// 문의글 작성 
	@Override
	public Inquiry insertInquiry(Inquiry i) {
		// TODO Auto-generated method stub
		return dao.save(i);
		
	}

	@Override
	public int deleteInquiry(Inquiry i) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateInquiry(Inquiry i) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

}
