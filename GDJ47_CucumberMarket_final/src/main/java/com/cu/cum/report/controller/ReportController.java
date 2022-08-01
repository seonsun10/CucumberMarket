package com.cu.cum.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ReportController {
	
	@RequestMapping(value="/reportWrite", method=RequestMethod.GET)
	public String report() {
		return "/report/reportWrite";
	}
	
	
	@RequestMapping(value="/reportList", method=RequestMethod.GET)
	public String reportList() {
		return "/report/reportList";
	}
	
	@RequestMapping(value="/reportView", method=RequestMethod.GET)
	public String reportView() {
		return "/report/reportView";
	}

}
