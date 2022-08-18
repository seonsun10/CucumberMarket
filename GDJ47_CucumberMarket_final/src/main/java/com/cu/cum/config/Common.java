package com.cu.cum.config;

import java.text.DecimalFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.cu.cum.alert.model.service.CommonService;


public class Common {
	
	
	
	
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
