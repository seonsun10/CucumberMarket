package com.cu.cum.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cu.cum.member.model.vo.Member;

@Controller
public class MemberController {
	
//	@Autowired
//	private MemberService service;
//	
	@GetMapping({"","/"})
	public String index() {
		return "index"; //뷰리졸버 파일 설정 확인 "Path with "WEB-INF" or "META-INF": [WEB-INF/views/index.jsp]" 출력
	}
//	
//	@GetMapping("/register")
//	public Member insertMember() {
//		
//		
//		return "register";
//	}

}
