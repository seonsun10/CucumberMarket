package com.cu.cum.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.report.model.service.ReportService;
import com.cu.cum.report.model.vo.Report;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ReportController {
	
	//@Autowired
	public ReportService service;
	
	// 신고 설명 페이지
	@RequestMapping(value="/reportInfo", method=RequestMethod.GET)
	public String reportInfo() {
		return"/report/reportInfo";
	}
	
	// 신고글 작성 페이지
	@RequestMapping(value="/reportWrite", method=RequestMethod.GET)
	public String report() {
		return "/report/reportWrite";
	}
	
	// 신고글 목록 페이지
	@RequestMapping(value="/reportList", method=RequestMethod.GET)
	public String reportList() {
		return "/report/reportList";
	}
	
	// 신고글 상세 페이지
	@RequestMapping(value="/reportView", method=RequestMethod.GET)
	public String reportView() {
		return "/report/reportView";
	}
	
	
	public String insertReport(@RequestParam("reportId") String id,@RequestParam("proNo") int proNo,  @RequestParam("repTitle") String repTitle, 
			@RequestParam("repContent") String repContent, @RequestParam("targetId") String targetId) {
		Member loginMember=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Report r = Report.builder().repTitle(repTitle).repContent(repContent).proNo(proNo).targetId(targetId).build();
		
		//service.insertReport(r);
		return "redirect:/reportList";
	}

}
