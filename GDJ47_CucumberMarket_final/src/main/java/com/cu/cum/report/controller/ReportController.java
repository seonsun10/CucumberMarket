package com.cu.cum.report.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.pagebar.PageBarBasic;
import com.cu.cum.report.model.service.ReportService;
import com.cu.cum.report.model.vo.Report;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ReportController {
	
	@Autowired
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
	
//	// 신고글 목록 페이지
//	@RequestMapping(value="/reportList", method=RequestMethod.GET)
//	public String reportList() {
//		return "/report/reportList";
//	}
	
	// 신고글 상세 페이지
	@RequestMapping(value={"/reportView/{id}"})
	public ModelAndView selectReport(@PathVariable int id, ModelAndView mv) {
		mv.addObject("rep", service.selectReport(id));
		mv.setViewName("report/reportView");
		return mv;
	}
	
	// 신고글 작성 로직 
	@RequestMapping("/report/insertReport.do")
	public ModelAndView insertReport(@RequestParam("repId") String id, @RequestParam("repType") String repType,  @RequestParam("repTitle") String repTitle, 
			@RequestParam("repContent") String repContent, @RequestParam("targetId") String targetId, ModelAndView mv) {
		Member loginMember=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Report r = Report.builder().userId(loginMember).repType(repType).repTitle(repTitle).repContent(repContent).targetId(targetId).build();
		System.out.println(r);
		Report rpt = service.insertReport(r);
		//int rptCount = service.reportCount();
		if(!(rpt.equals(null))) {
			mv.addObject("msg", "신고글 작성완료");
			mv.addObject("loc","/member/mypage");
			
		}else {
			mv.addObject("msg", "신고글 작성실패");
			mv.addObject("loc","report/insertReport.do");
		} 
		mv.setViewName("common/msgBasic");
		return mv;
	}
	
	// 신고글 리스트(페이징처리)
	@RequestMapping("/reportList")
	@ResponseBody
	public ModelAndView selectReportList(@RequestParam(defaultValue="1") int cPage,
			@RequestParam(defaultValue="5") int numPerpage,
			ModelAndView model) {
		Map param = Map.of("cPage",cPage, "numPerpage",numPerpage);
		List<Report> report = service.selectReportList(param);
		int totalData = service.selectReportCount();
		model.addObject("report", report);
		model.addObject("pageBar", PageBarBasic.getPageBar(cPage, numPerpage, totalData, "reportList"));
		model.addObject("totalData", totalData);
		model.setViewName("report/reportList");
		//System.out.println(report);
		return model;
	}
	
	// 신고글 삭제 
	@RequestMapping("/deleteReport/{id}")
	public ModelAndView deleteReport(Report report, @PathVariable int id, HttpSession session, ModelAndView mv) {
		
		report.setUserId((Member)session.getAttribute("loginMember"));
		int rep = service.deleteReport(id);
		if(rep>0) {
			mv.addObject("msg", "신고글 삭제완료");
			mv.addObject("loc","/reportList");
			
		}else {
			mv.addObject("msg", "신고글 삭제실패");
			mv.addObject("loc","reportList");
		}
		mv.setViewName("common/msgBasic");
		return mv;
	}
	
	// 신고글 검색
	@RequestMapping("/searchReport.do")
	public ModelAndView searchReport(@RequestParam("searchType") String searchType, String keyword, ModelAndView model) {
		log.debug(searchType);
		List<Report> report = new ArrayList();
		if(searchType.equals("reportTitle")) {
			// 제목으로 검색
			report = service.searchReportTitle(keyword);
		}else if(searchType.equals("reportType")) {
			// 사유로 검색
			report = service.searchReportType(keyword);
		}
		
		model.addObject("report", report);
		model.setViewName("report/reportList");
		// System.out.println(report);
		return model;
	}
	
	
	
	


}
