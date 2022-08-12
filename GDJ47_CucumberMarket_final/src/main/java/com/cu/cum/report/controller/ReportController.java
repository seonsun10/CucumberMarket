package com.cu.cum.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	@RequestMapping(value={"/reportWrite/{id}"})
	public ModelAndView report(@PathVariable String id, ModelAndView mv) {
		mv.addObject("id",id);
		mv.setViewName("/report/reportWrite");
		
		return mv;
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
	
	// 신고글 작성 로직 
	@RequestMapping("/report/insertReport.do")
	public String insertReport(@RequestParam("repId") String id, @RequestParam("repType") String repType,  @RequestParam("repTitle") String repTitle, 
			@RequestParam("repContent") String repContent, @RequestParam("targetId") String targetId) {
		Member loginMember=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Report r = Report.builder().userId(loginMember).repType(repType).repTitle(repTitle).repContent(repContent).targetId(targetId).build();
		System.out.println(r);
		Report rpt = service.insertReport(r);
		return "redirect:/reportList";
	}

}
