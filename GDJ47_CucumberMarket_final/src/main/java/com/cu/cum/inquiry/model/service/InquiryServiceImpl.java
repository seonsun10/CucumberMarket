package com.cu.cum.inquiry.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cu.cum.inquiry.model.dao.InquiryDao;
import com.cu.cum.inquiry.model.dao.InquiryMapperDao;
import com.cu.cum.inquiry.model.vo.Inquiry;

@Service
public class InquiryServiceImpl implements InquiryService {
	
	@Autowired
	private InquiryDao dao;
	
	@Autowired
	private InquiryMapperDao imdao;
	
	@Autowired
	private SqlSessionTemplate session;

	// 문의글 목록
	@Override
	public List<Inquiry> selectInquiryList(){
		// TODO Auto-generated method stub
		return dao.findAll();
	}

	// 문의글 목록 페이징 처리
	@Override
	public List<Inquiry> selectInquiryListPage(Map param) {
		// TODO Auto-generated method stub
		return imdao.selectInquiryListPage(session,param);
	}
	
	
	@Override
	public int selectInquiryCount() {
		// TODO Auto-generated method stub
		return imdao.selectInquiryCount(session);
	}

	// 문의글 상세 정보
	@Override
	public Inquiry selectInquiry(int inquiryno) {
		// TODO Auto-generated method stub
		return dao.findByInquiryNo(inquiryno);
	}

	// 문의글 작성 
	@Override
	public Inquiry insertInquiry(Inquiry i) {
		// TODO Auto-generated method stub
		return dao.save(i);
		
	}

	
	// 문의글 삭제
	@Override
	public int deleteInquiry(int id) {
		//public Inquiry deleteInquiry(int inquiryNo) {
		// TODO Auto-generated method stub
		return imdao.deleteInquiry(session, id);
		//return dao.deleteByInquiryNo(inquiryNo);
	}

	
	// 문의글 수정
	@Override
	public int updateInquiry(Inquiry i) {
		// TODO Auto-generated method stub
		return imdao.updateInquiry(session, i);
	}
	
	// 문의 글 상세페이지 수정 전 내용 불러오기 
	@Override
	public Inquiry findByInquiryNo(int inquiryNo) {
		return dao.findByInquiryNo(inquiryNo);
	}
	// 문의 글 검색
	@Override
	public List<Inquiry> searchList(String keyword) {
		return dao.findByinquiryTitleContaining(keyword);
	}
	
	

}
