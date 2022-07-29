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
	
	@RequestMapping(value="/inquiry", method=RequestMethod.GET)
	public String inquiry() {
		return "/inquiry/inquiry";
	}
	
	@RequestMapping(value="/inquiryView", method=RequestMethod.GET)
	public String inquiryView() {
		return "/inquiry/inquiryView";
	}
	
	
	@RequestMapping(value="/inquiryWrite", method=RequestMethod.GET)
	public String inquiryWrite() {
		return "/inquiry/inquiryWrite";
	}
	
//	@RequestMapping(value="/inquiryList", method=RequestMethod.GET)
//	public List<Inquiry> selectInquiryList() {
//		return inquiryService.selectInquiryList();
//	}

}
