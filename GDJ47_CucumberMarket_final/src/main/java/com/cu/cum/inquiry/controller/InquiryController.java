package com.cu.cum.inquiry.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cu.cum.inquiry.model.service.InquiryService;
import com.cu.cum.inquiry.model.vo.Inquiry;
import com.cu.cum.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class InquiryController {
	
	@Autowired
	public InquiryService service;
	
	// 자주 묻는 질문 페이지
	@RequestMapping(value="/faqList", method=RequestMethod.GET)
	public String inquiry() {
		return "inquiry/faqList";
	}
	
//	// 문의글 목록 페이지  -> 문의글 리스트 불러오기로 대체 
//	@RequestMapping(value="/inquiryList", method=RequestMethod.GET)
//	public String inquiryList() {
//		return "/inquiry/inquiryList";
//	}
	
	// 문의글 작성 페이지
	@RequestMapping(value="/inquiryWrite", method=RequestMethod.GET)
	public String inquiryWrite() {
		return "inquiry/inquiryWrite";
	}
	
	// 문의글 클릭 후 나오는 페이지 (각각의 문의글 내용 보기)
//	@RequestMapping(value="/inquiryView", method=RequestMethod.GET)
//	public String selectInquiry() {
//		return "inquiry/inquiryView";
//	}
	
	@RequestMapping(value={"/inquiryView/{id}"})
	public ModelAndView selectInquiry(@PathVariable int id, ModelAndView mv) {
		mv.addObject("inq", service.selectInquiry(id));
		mv.setViewName("inquiry/inquiryView");
		if(mv!=null) {
		System.out.println(mv);
	}
		return mv;
	}
	
	// 문의글 불러오는 로직
	@RequestMapping("/inquiryList")
	@ResponseBody
	public ModelAndView selectInquiryList(ModelAndView model) {
		List<Inquiry> list = service.selectInquiryList();
		model.addObject("list",list);
//		if(list!=null) {
//			System.out.println(list);
//		}
		
		model.setViewName("inquiry/inquiryList");
		return model;
	}

	// 문의글 작성 로직 
	@RequestMapping("/inquiry/insertInquiry.do")
	@ResponseBody
	public String insertInquiry(@RequestParam("inquiryId") String id,@RequestParam("inquiryTitle") String inquiryTitle,
			@RequestParam("inquiryPhone") String phone,
			@RequestParam("inquiryType") String type,
			@RequestParam("inquiryContent") String content) {
		Member loginMember=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Inquiry i = Inquiry.builder().inquiryTitle(inquiryTitle).inquiryPhone(phone).writer(loginMember)
				.inquiryType(type).inquiryContent(content).build();
	
		Inquiry inq = service.insertInquiry(i);
		
		
		return "inquiry/inquiryList";
	}
	
	
	
}
