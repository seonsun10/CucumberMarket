package com.cu.cum.member.controller;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cu.cum.member.model.dao.MemberRepository;
import com.cu.cum.member.model.service.MemberService;
import com.cu.cum.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService service;
	
	@GetMapping({"","/"})
	public String index(Principal p,Model m) {
		log.debug("{}",p);
		
//		m.getAttribute(); //무엇을 해야하는 건지 다시 생각해보기
		return "index";
	}
	
	@RequestMapping("/insertAdmin")
	@ResponseBody
	public Member insertAdmin() {
		Member m = Member.builder().userId("admin").password("1234")
				.phone("01012341234").build();
		
		Member result = service.insertAdmin(m);
		
		return result;
	}
	
	//회원가입 페이지로
	@RequestMapping(value = "/joinForm", method =RequestMethod.GET)
	public String joinForm() {
		return "/member/joinForm";
	}
	
	//회원가입
	@PostMapping("/join")
	public ModelAndView join(@ModelAttribute Member member) {
		service.join(member);
		return new ModelAndView("redirect:/"); //회원가입 후, 메인 화면으로 바로 이동
 	}
	
//	@PostMapping("/join")
//	public String join(Member member) {
//		logger.debug("원본 :{}", member.getPassword());
//		String rawPassword = member.getPassword();
//		String encPassword = pwEncoder.encode(rawPassword);
//		//패스워드 암호화
//		logger.debug("암호화 :{}",pwEncoder.encode(member.getPassword()));
//		member.setPassword(pwEncoder.encode(member.getPassword()));
//		member.setPassword(encPassword);
//		
//		dao.save(member);
//	
//		return "redirect:/login";
//	}
	

}
