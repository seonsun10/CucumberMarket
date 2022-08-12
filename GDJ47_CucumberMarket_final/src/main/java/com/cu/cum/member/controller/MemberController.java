package com.cu.cum.member.controller;

import java.security.Principal;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;



import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import com.cu.cum.product.model.service.ProductService;
import com.cu.cum.product.model.vo.Files;
import com.cu.cum.product.model.vo.Product;
import com.cu.cum.product.model.vo.Review;
import com.cu.cum.wishlist.model.service.WishListService;
import com.cu.cum.wishlist.model.vo.WishList;

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
	private WishListService wlservice;
	
	@Autowired
	private ProductService proservice;
	
	
	//메인 페이지 오늘의 추천 상품 리스트 출력
	@GetMapping({"","/"})
	public String index(Principal p,Model m) throws ParseException {
		log.debug("{}",p);
		//메인 페이지 오늘의 추천 상품 리스트 출력
		List<Product> mp = proservice.mainProductList(); //썸네일만 나오게 걸림
		System.out.println("mp : "+mp);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		List days = new ArrayList();
		for(int i=0; i<mp.size(); i++) {
			LocalDate today=LocalDate.now();
			//LocalDate targetDay=mp.get(i).getEnrollDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
			LocalDate targetDay = new java.sql.Date(mp.get(i).getEnrollDate().getTime()).toLocalDate();
			
			Long day= ChronoUnit.DAYS.between(today, targetDay);
			days.add(Math.abs(day));	
		}
		System.out.println("날짜 처리후 mp : "+mp);	
		
		
		//추천 상품 리스트에 이미지
		List<Files> mpf = new ArrayList();
		for(Product pp : mp) {
			mpf.addAll(pp.getFiles());
		}
		System.out.println("mpf : "+mpf);
		m.addAttribute("mp",mp);
		m.addAttribute("mpf",mpf);
		m.addAttribute("days",days);
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
		m.addAttribute("solveCount",proservice.selectSolveCount(userId));
		m.addAttribute("productCount",productCount);
		m.addAttribute("viewCount",service.selectViewCount(userId));
		return "member/mypage";
	}
	
	//회원정보수정 페이지로 이동
	@RequestMapping("/member/myAccount.do")
	public String myAccount() {
		return "member/myAccount";
	}
	//찜목록 이동
	@RequestMapping("/member/wishList.do")
	public String wishList(@RequestParam("userId") String userId,
							Model m) {
		List<WishList> list = wlservice.selectWishList(service.searchMember(userId));
		List<Product> products = new ArrayList();
		List dayList = new ArrayList();
		for(WishList w : list) {
			products.add(proservice.selectProduct(w.getProduct().getProNo()));
			LocalDate today=LocalDate.now();
			LocalDate targetDay=new java.sql.Date(w.getCreateDate().getTime()).toLocalDate();
			Long day= ChronoUnit.DAYS.between(today, targetDay);
			dayList.add(Math.abs(day));
		}
		m.addAttribute("products",products);
		log.debug("결과 : "+list);
		if(list.size()!=0) {
			m.addAttribute("wishList",list);
		}
		m.addAttribute("dayList",dayList);
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
		//log.debug("{}",p1.getFiles().get(0).getRenameFilename());
		String url=request.getRequestURI();
		
		
		int totalProduct=proservice.selectProductCount(userId);
		Member loginMember=(Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		System.out.println("유저가 가지고 있는 상품 목록 : "+products);

		
		List<Files> pp = service.selectUserFiles(userId);//db거쳐서 회원이 가진 모든 파일 가져오기;
		System.out.println("유저가 가지고 잇는 상품 대표이미지 : "+pp);
		

//		List<Product> list=dao.findAllByMember(loginMember);
		//페이징처리 jpa
		//List<Product> list2=dao.findAll(PageRequest.of(0,5,Sort.by("enrollDate").descending())).getContent();
		//list2=list2.stream().filter(v -> v.getMember().equals(loginMember)).collect(Collectors.toList());
		
		
		m.addAttribute("pageBar",PageBar.getPageBar(cPage, numPerpage , totalProduct, url));
		m.addAttribute("products",products);
		m.addAttribute("totalProduct",totalProduct);
		m.addAttribute("pp",pp);
		
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
		mv.addObject("pageBar",PageBar.getPageBar(cPage, numPerpage, totalwish, url));
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
								@RequestParam(defaultValue="no") String customer,
								HttpServletRequest request,
								HttpServletResponse response,
								Model m) {
		
		Cookie oldCookie = null;
	    Cookie[] cookies = request.getCookies();
	    if (cookies != null) {
	        for (Cookie cookie : cookies) {
	            if (cookie.getName().equals("postView")) {
	                oldCookie = cookie;
	            }
	        }
	    }
	    if(!customer.equals("no")) {
		    if (oldCookie != null) {
		        if (!oldCookie.getValue().contains("[" + customer.toString() + "]")) {
		            service.viewCountUp(writer);
		            oldCookie.setValue(oldCookie.getValue() + "_[" + customer + "]");
		            oldCookie.setPath("/");
		            oldCookie.setMaxAge(60 * 60 * 12);
		            response.addCookie(oldCookie);
		        }
		    } else {
		        service.viewCountUp(writer);
		        Cookie newCookie = new Cookie("postView","[" + customer + "]");
		        newCookie.setPath("/");
		        newCookie.setMaxAge(60 * 60 * 12);
		        response.addCookie(newCookie);
		    }
	    }
		Member member = service.selectMember(writer);
		m.addAttribute("viewCount",service.selectViewCount(writer));
		m.addAttribute("productCount",proservice.selectProductCount(writer));
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
