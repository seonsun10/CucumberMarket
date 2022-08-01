package com.cu.cum.member.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.cu.cum.member.model.service.MemberService;
import com.cu.cum.member.model.vo.Member;
import com.cu.cum.pagebar.PageBar;
import com.cu.cum.product.model.service.ProductService;
import com.cu.cum.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder; 
	
	@Autowired
	private MemberService service;
	
	@Autowired
	private ProductService proservice;
	
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
	//찜목록 이동
	@RequestMapping("/member/wishList.do")
	public String wishList() {
		return "member/wishList";
	}
	
	//비밀번호 변경
	@RequestMapping("/member/pwUpdate.do")
	public String pwUpdate(@RequestParam String userId,
							@RequestParam String oldPw,
							@RequestParam String newPw, Model model) {
		
		Member m = service.searchMember(userId);
		
		log.debug("{}",m);
		log.debug("{}",pwEncoder.matches(oldPw, m.getPassword()));
		
		model.addAttribute("loc","member/myAccount.do");
		
		if(!(pwEncoder.matches(oldPw, m.getPassword()))) {
			model.addAttribute("msg","현재 비밀번호가 일치하지 않습니다.");
		}else {
			m.setPassword(pwEncoder.encode(newPw));
			service.updatePassword(m);
			model.addAttribute("msg","비밀번호를 변경하였습니다.");
		}
		return "common/msg";
	}
	
	//마이페이지에서 상품 목록 뿌리는 페이지
	@RequestMapping("/member/mypageProduct.do")
	public String propage(@RequestParam(defaultValue="1") int cPage,
							@RequestParam(defaultValue="5") int numPerpage,
							@RequestParam String userId,
							HttpServletRequest request,
							Model m) {
		Map page = Map.of("cPage",cPage,"numPerpage",numPerpage,"userId",userId);
		List<Product> products=proservice.selectProductList(page);
		String url=request.getRequestURI();
		int totalProduct=proservice.selectProductCount(userId);
		m.addAttribute("pageBar",PageBar.getPageBar(cPage, numPerpage, totalProduct, url));
		m.addAttribute("product",products);
		m.addAttribute("totalProduct",totalProduct);
		return "member/mypageProduct";
	}
	//마이페이지에서 후기 목록 뿌리는 페이지
	@RequestMapping("/member/mypageReview.do")
	public String reviewpage() {
		return "member/mypageReview";
	}
	//마이페이지에서 찜 목록 뿌리는 페이지
	@RequestMapping("/member/mypageDibs.do")
	public String dibspage() {
		return "member/mypageDibs";
	}
	//마이페이지에서 신고 목록 뿌리는 페이지
	@RequestMapping("/member/mypageReport.do")
	public String reportpage() {
		return "member/mypageReport";
	}
	//마이페이지에서 채팅 목록 뿌리는 페이지
	@RequestMapping("/member/mypageChat.do")
	public String chatpage() {
		return "member/mypageChat";
	}
	
}
