package com.cu.cum.alert.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cu.cum.alert.model.service.AlertService;
import com.cu.cum.alert.model.service.CommonService;
import com.cu.cum.alert.model.vo.Alert;
import com.cu.cum.config.Common;
import com.cu.cum.member.model.vo.Member;
import com.cu.cum.test.model.vo.MessageContent;
import com.fasterxml.jackson.databind.ObjectMapper;



@Controller
public class AlertControllerImpl implements AlertController{
	
	@Autowired
	AlertService service;
	
	@Autowired
	CommonService Commonservice;	// 날짜변환
	
	
	
	// 알림조회 (전체)
	@Override
	@RequestMapping("/member/notify.do")
	public ModelAndView notifyInit(@RequestParam(defaultValue = "1") int curPage, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		String userid= ((Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUserId();
		// 세션에 userid가 존재할 때 
		if(userid != null && !"".equals(userid)){
			// 새로운 알람 조회
			List<Alert> newList = service.searchNewNotifyList(userid);
			List<Alert> oldList = service.searchOldNotifyList(userid);
			for(Alert vo : newList) {	// 날짜 포맷 변경
				vo.setN_time(Common.formatTimeString(vo.getN_time(), Commonservice));
			}
		
			
			
			// 이전 알람 조회
			// 정보 전달

			mav.addObject("newList", newList);
			mav.addObject("oldList", oldList);
			mav.addObject("oldListCnt", service.selectOldNotifyCnt(userid));
		}
		return mav;
	}
	
	
	// 채팅조회 (전체)
		@Override
		@RequestMapping("/member/chat.do")
		public ModelAndView chatInit(@RequestParam(defaultValue = "1") int curPage, HttpServletRequest request) throws Exception{
			ModelAndView moav = new ModelAndView();
			String userid= ((Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUserId();
			// 세션에 userid가 존재할 때 
			if(userid != null && !"".equals(userid)){
				// 새로운 채팅 조회
				List<MessageContent> newChatList = service.searchNewChatList(userid);
				List<MessageContent> oldChatList = service.searchOldChatList(userid);
			
				
				
				// 이전 알람 조회
				// 정보 전달

				moav.addObject("newChatList", newChatList);
				moav.addObject("oldChatList", oldChatList);
				moav.setViewName("alert/chat");
			}
			return moav;
		}
		
	
	
	
	// 더보기 요청
/*	@Override
	@RequestMapping(value = "/member/searchMoreNotify.do", produces = "application/text;charset=UTF-8", method=RequestMethod.POST)
	@ResponseBody
	public String searchMoreNotify(@RequestParam Map<String,String> param) throws Exception {
		Map<String, String> searchParam = new HashMap<String, String>();	// search 파라미터 생성
		searchParam.put("startIndex", param.get("startIndex"));	
		searchParam.put("endIndex", param.get("endIndex"));
		searchParam.put("m_id", param.get("m_id"));
		// startIndex ~ endIndex 범위에 해당하는 list 조회 
		List<Alert> addList = service.searchOldNotifyList(searchParam);
		for(Alert vo : addList) {	// 날짜 포맷 변경
			vo.setN_time(Common.formatTimeString(vo.getN_time(), Commonservice));
		}
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr = mapper.writeValueAsString(addList);
		return jsonStr;
	}
	*/
	// 읽음상태 변경 
	@Override
	@RequestMapping("/member/readNotify.do")
	@ResponseBody
	public void readNotify(@RequestParam String n_id, HttpServletRequest request) {
		Map<String, String> param = new HashMap<String, String>();
		
		param.put("n_id", n_id);
		param.put("userId", ((Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUserId());
		
		service.updateNotifyChecked(param);
		System.out.println(param);
		
	}
	
	// 새 알림 조회
	@Override
	@RequestMapping("member/selectNewNoticeCnt.do")
	@ResponseBody
	public String selectNewNoticeCnt(@RequestParam String userId) {
		return service.selectNewNotifyCnt(userId)+"";
	}
	
	//새 채팅 조회
	@Override
	@RequestMapping("member/selectNewChatCnt.do")
	@ResponseBody
	public String selectNewChatCnt(@RequestParam String userId) {
		return service.selectnewChatCnt(userId)+"";
	}
	
	// notify DB저장
	@Override
	@RequestMapping("member/saveNotify.do")
	@ResponseBody
	public void saveNotify(@RequestParam Map<String,String> param) throws Exception {
		Alert vo = new Alert();
		vo.setN_target(param.get("target"));
		vo.setN_content(param.get("content"));
		vo.setN_type(param.get("type"));
		vo.setN_url(param.get("url"));
		service.insertNotify(vo);
	}
	
		
	
		
}
