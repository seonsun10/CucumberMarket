package com.cu.cum.inquiry.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
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
import com.cu.cum.pagebar.PageBarBasic;
import com.cu.cum.pagebar.PageBarInquiry;

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
	
	// 문의글 수정 페이지
//	@RequestMapping(value="/updateInquiry", method=RequestMethod.GET)
//	public String updateInquiry(@RequestParam int inquiryNo,Model m) {
//		m.addAttribute("inquiryNo",inquiryNo);
//		return "inquiry/updateInquiry";
//	}
	
	@RequestMapping(value={"/updateInquiry/{id}"})
	public ModelAndView updateInquiry(@PathVariable  int id, ModelAndView mv) {
		mv.addObject("inq", service.selectInquiry(id));
		mv.setViewName("inquiry/updateInquiry");
		System.out.println(mv);
		return mv;
	}
	

	
	// 문의글 클릭 후 나오는 페이지 (각각의 문의글 내용 보기)
//	@RequestMapping(value="/inquiryView", method=RequestMethod.GET)
//	public String selectInquiry() {
//		return "inquiry/inquiryView";
//	}
	
	// 문의글 상세페이지 
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
//	@RequestMapping("/inquiryList")
//	@ResponseBody
//	public ModelAndView selectInquiryList(ModelAndView model) {
//		List<Inquiry> list = service.selectInquiryList();
//		model.addObject("list",list);
////		if(list!=null) {
////			System.out.println(list);
////		}
//		
//		model.setViewName("inquiry/inquiryList");
//		return model;
//	}
	// 문의글 페이징 처리 
	@RequestMapping("/inquiryList")
	@ResponseBody
	public ModelAndView selectInquiryList(@RequestParam(defaultValue="1") int cPage,
			@RequestParam(defaultValue="5") int numPerpage,
			ModelAndView model) {
		Map param = Map.of("cPage",cPage, "numPerpage",numPerpage);
		List<Inquiry> list = service.selectInquiryListPage(param);
		int totalData=service.selectInquiryCount();
		model.addObject("list",list);
		model.addObject("pageBar",PageBarBasic.getPageBar(cPage,numPerpage, totalData,   "inquiryList" ));
		model.addObject("totalData", totalData);
		//System.out.println(list);
		model.setViewName("inquiry/inquiryList");
		return model;
	}

	// 문의글 작성 로직 
	@RequestMapping("/inquiry/insertInquiry.do")
	public String insertInquiry(@RequestParam("inquiryId") String id,@RequestParam("inquiryTitle") String inquiryTitle,
			@RequestParam("inquiryPhone") String phone,
			@RequestParam("inquiryType") String type,
			@RequestParam("inquiryContent") String content, Model model) {
		Member loginMember=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		Inquiry i = Inquiry.builder().inquiryTitle(inquiryTitle).inquiryPhone(phone).writer(loginMember)
				.inquiryType(type).inquiryContent(content).build();
	
		Inquiry inq = service.insertInquiry(i);
		
		return "redirect:/inquiryList";
	}
	
	// 문의글 검색 jpa 
	@RequestMapping("/searchInquiry.do")
	public ModelAndView searchList(@RequestParam("searchType") String searchType, String keyword, ModelAndView model) {
		log.debug(searchType);
		List<Inquiry> list = new ArrayList();
		if(searchType.equals("inquiryTitle")) {
			list = service.searchList(keyword);
			
		}else if(searchType.equals("inquiryType")) {
			list = service.searchListType(keyword);
		}
		
		model.addObject("list", list);
		model.setViewName("inquiry/inquiryList");
		System.out.println(list);
		return model;
	}
	
	// 문의 글 제목으로 검색
//	@RequestMapping("/searchInquiry.do")
//	public ModelAndView searchListTest( String keyword, ModelAndView model
//			,@PageableDefault(size = 5, sort = "inquiryType", direction = Sort.Direction.DESC) Pageable pageable) {
//		List<Inquiry> list = service.searchListTest(keyword, pageable);
//		model.addObject("list", list);
//		model.addObject("previous", pageable.previousOrFirst().getPageNumber());
//        model.addObject("next", pageable.next().getPageNumber());
//		model.setViewName("inquiry/inquiryList");
//		return model;
//	}
	

	
	
	// 문의글 수정
	@RequestMapping("inquiry/updateInquiry.do")
	public String updateInquiry(Inquiry inquiry, String inquiryId,HttpSession session) {
		//Inquiry inquiry = Inquiry.builder().inquiryTitle(inquiryTitle).inquiryType(inquiryTitle).inquiryContent(content).inquiryNo(inquiryNo).build();
		//System.out.println(inquiry);
		inquiry.setWriter((Member)session.getAttribute("loginMember"));
		int inq = service.updateInquiry(inquiry);
		
		return "redirect:/inquiryList";
	}
	
	// 문의글 삭제 
	
	@RequestMapping("/deleteInquiry/{id}")
	public String deleteInquiry(Inquiry inquiry, @PathVariable int id,HttpSession session) {
		//public String deleteInquiry(@RequestParam int inquiryNo, Model m) {
		
		inquiry.setWriter((Member)session.getAttribute("loginMember"));
		System.out.println(inquiry);
		int inq = service.deleteInquiry(id);
		
		return "redirect:/inquiryList";
	}
	
	// 문의글 답변 페이지
	
	@RequestMapping("/replyInquiry/{id}")
	public ModelAndView replyInquiry(@PathVariable int id, ModelAndView mv) {
		mv.addObject("inq", service.selectInquiry(id));
		mv.setViewName("inquiry/replyInquiry");
		return mv;
	}
	
	
	// 문의글 답변 작성 로직
//	@RequestMapping("/inquiry/replyInquiry.do")
//	public String insertReply(
//			@RequestParam("inquiryId") String id,
//			@RequestParam("replyinquiryTitle") String replyinquiryTitle,
//			@RequestParam("inquiryNo") int inquiryNo,
//			@RequestParam("replyinquiryContent") String replycontent, Model model) {
//		Member loginMember=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		
//		 ReplyInquiry r = ReplyInquiry.builder().inquiryTitle(replyinquiryTitle).inquiryNo(inquiryNo).writer(loginMember)
//				.inquiryContent(replycontent).build();
//	
//		 ReplyInquiry ri = service.insertInquiry(r);
//		
//		return "redirect:/inquiryList";
//	}
	
	
	
	
}
