package com.cu.cum.member.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.cu.cum.member.model.service.MemberService;
import com.cu.cum.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes("loginMember")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping({"","/"})
	public String index(Principal p,Model m) {
		log.debug("{}",p);
//		m.getAttribute();
		return "index"; //뷰리졸버 파일 설정 확인 "Path with "WEB-INF" or "META-INF": [WEB-INF/views/index.jsp]" 출력
	}
	
	@RequestMapping("/insertAdmin")
	@ResponseBody
	public Member insertAdmin() {
		Member m = Member.builder().userId("admin").password("1234")
				.phone("01012341234").build();
		
		Member result = service.insertAdmin(m);
		
		return result;
	}
//	@RequestMapping("/successlogin")
//	public String loingInde(Principal p, Model m) {
//		log.debug("{}",p);
//		//m.addAttribute("loingId",p.getName());
//		return "index";
//	}
//	
//	@GetMapping("/register")
//	public Member insertMember() {
//		
//		
//		return "register";
//	}

	
	@RequestMapping("/successLogin.do")
	public String successLogin(Model m) {
		//인증받은 객체의 정보를 가져올 수 있다.
		//loadUserByUsername()메소드에서 반환하는 객체를 받을 수 있음.
		Object o = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		m.addAttribute("loginMember",(Member)o);
		return "redirect:/";
	}
	
	@RequestMapping("/successLogout.do")
	public String successLogout(SessionStatus session) {
		if(!session.isComplete()) {
			session.setComplete();
		}
		return "redirect:/";
	}
	
	
	@RequestMapping("/member/mypage.do")
	public String myPage() {
		return "member/mypage";
	}
	
	//회원정보수정 페이지로 이동
	@RequestMapping("/member/myAccount.do")
	public String myAccount() {
		return "member/myAccount";
	}

	@RequestMapping("/member/wishList.do")
	public String wishList() {
		return "member/wishList";
	}
}
