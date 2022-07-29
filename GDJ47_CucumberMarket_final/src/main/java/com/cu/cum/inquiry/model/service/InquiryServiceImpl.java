package com.cu.cum.inquiry.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.inquiry.model.dao.InquiryDao;
import com.cu.cum.inquiry.model.vo.Inquiry;

@Service
public class InquiryServiceImpl implements InquiryService {
	
//	@Autowired
//	private InquiryDao dao;

	@Override
	public List<Inquiry> selectInquiryList(){
		// TODO Auto-generated method stub
		return null;
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

	@Override
	public int inserInquiry(Inquiry i) {
		// TODO Auto-generated method stub
		return 0;
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
