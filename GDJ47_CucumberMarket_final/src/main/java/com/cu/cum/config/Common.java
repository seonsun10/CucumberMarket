package com.cu.cum.config;

import java.text.DecimalFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cu.cum.alert.model.service.CommonService;


public class Common {
	
	// 로그인 체크 메서드, dest = 목적지 view
	public static String checkLoginDestinationView(String dest, HttpServletRequest request) {
		// 세션체크
		String returnView = "alert/alert";	// 로그인 페이지
		HttpSession session = request.getSession(false);
		// 세션 멤버정보, 로그인상태 체크
		if(session!=null) {
			if(session.getAttribute("userid")!=null){
				returnView = dest;				// 목적지 view로
			}
		}
		return returnView;
	}
	// 로그인 체크 메서드, 로그인중이면 true 아니면 false 리턴
	public static boolean checkLoginStatus(HttpServletRequest request) {
		boolean result = false;
		HttpSession session = request.getSession(false);
		if(session!=null) {
			if(session.getAttribute("userid")!=null){
				result = true;
			}
		}
		return result;
	}
	
	// 천단위 컴마 찍기 
	 public static String toNumFormat(String num) {
		 DecimalFormat df = new DecimalFormat("#,###");
		 return df.format(Integer.parseInt(num));
	 }
	 
	
	 private static class TIME_MAXIMUM {
			public static final int SEC = 60;
			public static final int MIN = 60;
			public static final int HOUR = 24;
			public static final int DAY = 30;
			public static final int MONTH = 12;
	 }

	public static String formatTimeString(String regTime, CommonService commonService) {
		// 비교시간 생성 쿼리
		int diffTime = commonService.selectCompareTime(regTime);
		String msg = null;
		if (diffTime < TIME_MAXIMUM.SEC) {
			// sec
			msg = "방금 전";
		} else if ((diffTime /= TIME_MAXIMUM.SEC) < TIME_MAXIMUM.MIN) {
			// min
			msg = diffTime + "분 전";
		} else if ((diffTime /= TIME_MAXIMUM.MIN) < TIME_MAXIMUM.HOUR) {
			// hour
			msg = (diffTime) + "시간 전";
		} else if ((diffTime /= TIME_MAXIMUM.HOUR) < TIME_MAXIMUM.DAY) {
			// day
			msg = (diffTime) + "일 전";
		} else if ((diffTime /= TIME_MAXIMUM.DAY) < TIME_MAXIMUM.MONTH) {
			// month
			msg = (diffTime) + "달 전";
		} else {
			// year
			msg = (diffTime) + "년 전";
		}
		return msg;
	}



}
