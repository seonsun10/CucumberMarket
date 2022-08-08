package com.cu.cum.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ReportController {
	
	@RequestMapping(value="/reportInfo", method=RequestMethod.GET)
	public String reportInfo() {
		return"/report/reportInfo";
	}
	
	// 신고글 작성
	@RequestMapping(value="/reportWrite", method=RequestMethod.GET)
	public String report() {
		return "/report/reportWrite";
	}
	
	// 신고글 목록
	@RequestMapping(value="/reportList", method=RequestMethod.GET)
	public String reportList() {
		return "/report/reportList";
	}
	
	// 신고글 상세 페이지
	@RequestMapping(value="/reportView", method=RequestMethod.GET)
	public String reportView() {
		return "/report/reportView";
	}

}
