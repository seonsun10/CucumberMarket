package com.cu.cum.member.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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

import com.cu.cum.member.model.service.MemberService;
import com.cu.cum.member.model.vo.Member;
import com.cu.cum.pagebar.PageBar;
import com.cu.cum.pagebar.PageBarBasic;
import com.cu.cum.pagebar.TestPageBar;
import com.cu.cum.product.model.dao.ProductDao;
import com.cu.cum.product.model.service.ProductService;
import com.cu.cum.product.model.vo.Product;
import com.cu.cum.product.model.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes("loginMember")
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder; 
	
	@Autowired
	private ProductDao dao;

	@Autowired
	private MemberService service;
	
	@Autowired
	private ProductService proservice;
	
	@GetMapping({"","/"})
	public String index(Principal p,Model m) {
		log.debug("{}",p);
		
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
//		member.setRole("ROLE_USER");
		service.join(member);
		return new ModelAndView("redirect:/"); //회원가입 후, 메인 화면으로 바로 이동
 	}
	
	@RequestMapping("/loginpage")
	public String login() {
		System.out.println("로그인 과정 거침?");
		return "member/login";
	}
	
	@RequestMapping("/loginsuccess")
	public String successLogin(Model m) {
		//인증받은 객체의 정보를 가져올 수 있다.
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
	public String myPage(@RequestParam String userId, Model m) {
		m.addAttribute("userId",userId);
		int productCount = proservice.selectProductCount(userId);
		m.addAttribute("productCount",productCount);
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
		Product p1 = (Product)products.get(3);
		//log.debug("{}",p1.getFiles().get(0).getRenameFilename());
		log.debug("product : "+p1);
		String url=request.getRequestURI();
		
		int totalProduct=proservice.selectProductCount(userId);
		m.addAttribute("pageBar",PageBar.getPageBar(cPage, numPerpage, totalProduct, url));
		m.addAttribute("product",products);
		m.addAttribute("totalProduct",totalProduct);
		Member loginMember=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<Product> list=dao.findAllByMember(loginMember);
		//페이징처리 jpa
		List<Product> list2=dao.findAll(PageRequest.of(0,5,Sort.by("enrollDate").descending())).getContent();
		//list2=list2.stream().filter(v -> v.getMember().equals(loginMember)).collect(Collectors.toList());
		
		return "member/mypageProduct";
	}
	//마이페이지에서 후기 목록 뿌리는 페이지
	@RequestMapping("/member/mypageReview.do")
	public String reviewpage(@RequestParam(defaultValue="1") int cPage,
								@RequestParam(defaultValue="5") int numPerpage,
								@RequestParam String userId,
								HttpServletRequest request,
								Model m) {
		Map page = Map.of("cPage",cPage,"numPerpage",numPerpage,"userId",userId);
		List<Review> reviews=proservice.selectReviewList(page);

		String url=request.getRequestURI();
		int totalReview=proservice.selectReviewCount(userId);
		m.addAttribute("pageBar",PageBar.getPageBar(cPage, numPerpage, totalReview, url));
		if(reviews.size()> 0) {
			m.addAttribute("review",reviews);
		}
		m.addAttribute("totalReview",totalReview);
		return "member/mypageReview";
	}
	//마이페이지에서 찜 목록 뿌리는 페이지
	@RequestMapping("/member/mypageDibs.do")
	public ModelAndView dibspage(@RequestParam(defaultValue = "1") int cPage,
							@RequestParam(defaultValue = "5") int numPerpage,
							HttpServletRequest request,ModelAndView mv) {
		String userId= ((Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUserId();
		Map page = Map.of("cPage",cPage,"numPerpage",numPerpage,"userId",userId);
		List<Product> wishlist = proservice.selectWishList(page);
		String url=request.getRequestURI();
		int totalwish=proservice.selectWishCount(userId);
		System.out.println(url);
		System.out.println("사이즈: "+totalwish);
		System.out.println("ftx: "+wishlist);
		mv.addObject("pageBar",TestPageBar.getPageBar(cPage, numPerpage, totalwish, url));
		if(wishlist.size()>0) {
			mv.addObject("wish",wishlist);
		}
		mv.addObject("totalWish",totalwish);
		mv.setViewName("member/mypageDibs");
		return mv;
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
	//다른 사람 페이지 연결
	@RequestMapping("/member/otherMember.do")
	public String otherMember(@RequestParam String writer,
								Model m) {
		Member member = service.selectMember(writer);
		m.addAttribute("member",member);
		m.addAttribute("writer",writer);
		return "/member/otherMember";
	}
	//다른 사람 물품 정보
	@RequestMapping("/member/otherpageProduct.do")
	public String otherPage(@RequestParam(defaultValue="1") int cPage,
							@RequestParam(defaultValue="20") int numPerpage,
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
		m.addAttribute("writer",userId);
		return "member/otherpageProduct";
	}
	//다른 사람 페이지 후기
	@RequestMapping("/member/otherpageReview.do")
	public String otherPageReview(@RequestParam(defaultValue="1") int cPage,
									@RequestParam(defaultValue="5") int numPerpage,
									@RequestParam String userId,
									HttpServletRequest request,
									Model m) {
		Map page = Map.of("cPage",cPage,"numPerpage",numPerpage,"userId",userId);
		List<Review> reviews=proservice.selectReviewList(page);
		String url=request.getRequestURI();
		int totalReview=proservice.selectReviewCount(userId);
		m.addAttribute("pageBar",PageBar.getPageBar(cPage, numPerpage, totalReview, url));
		if(reviews.size()!=0) {
			m.addAttribute("review",reviews);
		}
		m.addAttribute("totalReview",totalReview);
		m.addAttribute("writer",userId);
		return "member/otherpageReview";
	}
	
	@RequestMapping("/denie")
	public String denine() {
		return "common/test";
				
	}
}
