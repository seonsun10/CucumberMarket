package com.cu.cum.alert.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface AlertController {
	
	//알림 생성
	
	
	
	// 알림조회 (전체)
		ModelAndView notifyInit(int curPage, HttpServletRequest request) throws Exception;
		//채팅 조회 (내거 전체)
		ModelAndView chatInit(int curPage, HttpServletRequest request) throws Exception;
		// 더보기 요청 (ajax)
//		String searchMoreNotify(Map<String, String> param) throws Exception;
		// 읽음상태 변경 
		void readNotify(String userId, HttpServletRequest request);
		// 새 채팅 cnt 조회
		String selectNewChatCnt(String userId);
		// 새 알림 cnt 조회
		String selectNewNoticeCnt(String userId);
		// notify DB저장
		void saveNotify(Map<String, String> param) throws Exception;
		
		
	

}
