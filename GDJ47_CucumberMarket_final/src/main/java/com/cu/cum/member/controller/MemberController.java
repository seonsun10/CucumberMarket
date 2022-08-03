package com.cu.cum.member.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.cu.cum.member.model.dao.MemberRepository;
import com.cu.cum.member.model.service.MemberService;
import com.cu.cum.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
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
	
//	@RequestMapping("/insertAdmin")
//	@ResponseBody
//	public Member insertAdmin() {
//		Member m = Member.builder().userId("admin").password("1234")
//				.phone("01012341234").build();
//		
//		Member result = service.insertAdmin(m);
//		
//		return result;
//	}
	
	//회원가입 페이지로
	@RequestMapping(value = "/joinForm", method =RequestMethod.GET)
	public String joinForm() {
		return "/member/joinForm";
	}
	
	//회원가입
	@PostMapping("/join")
	public ModelAndView join(@ModelAttribute Member member) {
		
		member.setEnrollDate(new Date());
		member.setIntro("안녕하세요 :D");
		member.setRole("ROLE_USER");
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

//	회원정보 수정 myAccount에서 넘어옴
	@RequestMapping("/member/update.do")
	public String memberUpdate(@RequestParam("phone") String phone,
			@RequestParam("intro") String intro , @RequestParam("id") String userId) {
		Member m = service.selectMember(userId);
		m.setPhone(phone);
		m.setIntro(intro);
		service.updateMember(m);
//		member.setPhone(null);
//		member.setIntro(null);
		return "redirect:/member/myAccount.do";
	}
	
	
	//로그인 정보 세션 저장
	@RequestMapping(value = "/sessionLogin", method = RequestMethod.POST)
	@ResponseBody
	public void sessionLogin(HttpServletRequest request, HttpSession session, Principal principal) {
		
		String sessionId = principal.getName();
		Member member = service.getData(sessionId);
		
		session.setAttribute("sessionId", member.getUserId());
	}
	
	@GetMapping("/member/{id}")
	public Member getMember(@PathVariable String id) {
		return service.selectMember(id);
	}
	
	@GetMapping("/member/")
	public List<Member> getMembers(){
		return service.selectMembers();
	}
}
