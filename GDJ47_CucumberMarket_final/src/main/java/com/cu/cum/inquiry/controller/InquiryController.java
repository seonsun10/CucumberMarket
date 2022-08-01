package com.cu.cum.inquiry.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cu.cum.inquiry.model.service.InquiryService;
import com.cu.cum.inquiry.model.vo.Inquiry;
import com.cu.cum.inquiry.controller.InquiryController;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class InquiryController {
	
	public InquiryService inquiryService;
	
	// 자주 묻는 질문 페이지
	@RequestMapping(value="/faqList", method=RequestMethod.GET)
	public String inquiry() {
		return "/inquiry/faqList";
	}
	
	// 문의글 목록
	@RequestMapping(value="/inquiryList", method=RequestMethod.GET)
	public String inquiryList() {
		return "/inquiry/inquiryList";
	}
	
	// 문의글 작성
	@RequestMapping(value="/inquiryWrite", method=RequestMethod.GET)
	public String inquiryWrite() {
		return "/inquiry/inquiryWrite";
	}
	
	// 문의글 클릭 후 나오는 페이지 
	@RequestMapping(value="/inquiryView", method=RequestMethod.GET)
	public String inquiryView() {
		return "/inquiry/inquiryView";
	}
	
	// 문의글 작성 로직
//	@RequestMapping("/inquiry/insertInquiry.do")
//	public String  selectInquiryList() {
//		return inquiryService.selectInquiryList();
//	}

}
