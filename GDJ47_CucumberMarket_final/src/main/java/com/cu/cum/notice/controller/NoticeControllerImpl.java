package com.cu.cum.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cu.cum.alert.model.service.CommonService;
import com.cu.cum.alert.model.vo.Alert;
import com.cu.cum.config.Common;
import com.cu.cum.notice.model.service.NoticeService;
import com.cu.cum.notice.model.vo.Notice;

@Controller

public class NoticeControllerImpl implements NoticeController  {

	

	@Autowired
	NoticeService service;
	@Autowired
	CommonService Commonservice;

	// ADMIN 영역
	// 공지사항 수정, 작성 폼 연결
	@Override
	@RequestMapping(value="/GDJ47_CucumberMarket_final/admin/initNotice.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView initNoticeForm(HttpServletRequest request) throws Exception {
		ModelAndView mav = new ModelAndView();
		String n_id = request.getParameter("n_id");
		if(n_id!=null && !"".equals(n_id)) {
			// 내용 전달
			Notice vo = service.searchNoticeById(n_id);
			mav.addObject("article", vo);
			mav.addObject("flag",1);	// 수정
		}else {
			mav.addObject("flag",0);	// 신규작성
		}
		return mav;
	}

	// 공지사항 작성
	@Override
	@RequestMapping(value="/GDJ47_CucumberMarket_final/admin/insertNotice.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String insertNotice(@RequestParam Map<String, String> param, HttpServletRequest request) throws Exception {
		Notice vo = new Notice(param.get("n_title"), param.get("n_content"));
		service.insertNotice(vo);
		return "redirect:/admin/searchNotice.do";
	}

	// 공지사항 수정
	@Override
	@RequestMapping(value="/GDJ47_CucumberMarket_final/admin/updateNotice.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateNotice(@RequestParam Map<String, String> param, HttpServletRequest request) throws Exception {
		Notice vo = new Notice(param.get("n_id"), param.get("n_title"), param.get("n_content"));
		service.updateNoticeById(vo);
		return "redirect:/admin/searchNotice.do";
	}

	// 공지사항 삭제
	@Override
	@RequestMapping(value="/GDJ47_CucumberMarket_final/admin/deleteNotice.do", method = {RequestMethod.POST, RequestMethod.GET})
	public String deleteNotice(HttpServletRequest request) throws Exception {
		String n_id = request.getParameter("n_id");
		if(n_id != null) {
			service.deleteNoticeById(n_id);
		}
		return "redirect:/admin/searchNotice.do";
	}

	// 어드민 - 공지사항 조회
	@Override
	@RequestMapping(value="/admin/searchNotice.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView searchNotice(@RequestParam(defaultValue = "1") int curPage, HttpServletRequest request) throws Exception {
		ModelAndView mav = setNoticeListObject(curPage);	// notice 리스트 생성
		
		mav.setViewName("notice/noticesearch");
		return mav;
	}
	
	// 메인(회원) - 공지사항 조회
	@RequestMapping(value="/notice.do", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView notice(@RequestParam(defaultValue = "1") int curPage, HttpServletRequest request) {
		ModelAndView mav = setNoticeListObject(curPage);	// notice 리스트 생성
		mav.setViewName("RootP003_d001_search_common");
		return mav;
	}
	
	// notice 리스트 생성 전달
	private ModelAndView setNoticeListObject(int curPage) {
		ModelAndView mav = new ModelAndView();
		// Pagination
		// 조회용 Parameter 생성
		Map<String, String> searchParam = new HashMap<String, String>();
		// Notice List 조회
		List<Notice> list = service.searchNoticeList(searchParam);
		for(Notice vo : list) {	// 날짜 포맷 변경
			vo.setN_time(Common.formatTimeString(vo.getN_time(), Commonservice));
		}
		mav.addObject("articleList",list);			//글목록
		return mav;
	}
	
}

