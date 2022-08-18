package com.cu.cum.wishlist.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.service.ProductService;
import com.cu.cum.product.model.vo.Files;
import com.cu.cum.product.model.vo.Product;
import com.cu.cum.wishlist.model.service.WishListService;
import com.cu.cum.wishlist.model.vo.WishList;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class WishListController {
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Autowired
	private ProductService pService;
	
	@Autowired
	private WishListService service;

	@Autowired
	private ProductService pservice;
	
	/*
	 * @RequestMapping("/product/productView.do") public String
	 * productView(HttpServletRequest request) { String id =
	 * request.getParameter("id"); int no =
	 * Integer.parseInt(request.getParameter("no")); System.out.println(id+" "+no);
	 * 
	 * Member m = Member.builder().userId(id).build(); Product p =
	 * Product.builder().proNo(no).build(); int count = 0; WishList wl =
	 * service.checkWishlist(m,p); if(wl!=null) { count = 1; }
	 * 
	 * Product p2 = pservice.selectProduct(no); request.setAttribute("pro", p2);
	 * System.out.println(count); request.setAttribute("count",count);
	 * request.setAttribute("id", id); request.setAttribute("no", no); return
	 * "product/productview"; }
	 */

	
	@RequestMapping("/wishlist/insertWishList.do")
	public String insertWishList(HttpServletRequest request, HttpServletResponse response,Model model) throws IOException, ServletException{
		String id = request.getParameter("id");
		int no = Integer.parseInt(request.getParameter("no"));
		//System.out.println(id);
		//System.out.println(no);
		String tag = request.getParameter("tag");
		String name = request.getParameter("name");
		String proStatus = request.getParameter("proStatus");
		String region = request.getParameter("region");
		//System.out.println(tag);
		Product p = Product.builder().proNo(no).build();
		Member m = Member.builder().userId(id).build();
		
		//상품 부분
		Product product = pservice.productCheck(no);
		//System.out.println("상품정보 가져온거 : "+product);
		List<String> filename = new ArrayList();
		for(int i=0; i<product.getFiles().size(); i++) {
			filename.add(product.getFiles().get(i).getRenameFilename());
		}
		
		Map param = new HashMap();
		String proContent = product.getProContent();//관련상품에 상세페이지에 보이는 상품은 뺴야하므로 db에서 제외시키기 위해 받아옴
		//String title = result.getTitle();
		param.put("proContent", proContent);
		param.put("tag", tag);
		
		List<Product> relProduct = pservice.relProduct(param);
		List<Files> relFiles = new ArrayList();
		//System.out.println("관련상품 : "+relProduct);
		for(int i=0; i<relProduct.size(); i++) {
			relFiles.addAll(relProduct.get(i).getFiles());
		}
		//관련상품 이미지
		List<String> relFilename = new ArrayList();
		for(int i=0; i<relFiles.size(); i++) {
			relFilename.add(relFiles.get(i).getRenameFilename());
		}
		//System.out.println("관련상품 이미지 파일 : "+relFilename);
		
		//위시리스트 부분
		WishList wl = WishList.builder().member(m).product(p).build();
		int checkresult = service.checkidWishlist(session,wl);
		//System.out.println(wl);
		int count;
		int wishNum = service.selectWishListNum(id);
		System.out.println("찜 개수 : "+wishNum);
		if(wishNum!=8) {
			if(checkresult>0) {
				count=0;
			}else {
				WishList result = service.insertWishlist(wl);
				count=1;
			}
			request.setAttribute("count",count);
		}else {
			request.setAttribute("msg", "찜은 8개만 등록가능합니다.");
			request.setAttribute("loc", "member/mypage.do");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
		}

		request.setAttribute("id", id);
		request.setAttribute("no", no);
		request.setAttribute("tag",tag);
		request.setAttribute("result", product);
		request.setAttribute("filename", filename);
		request.setAttribute("name", name);
		request.setAttribute("region", region);
		request.setAttribute("proStatus", proStatus);
		request.setAttribute("relProduct",relProduct);
		request.setAttribute("relFilename", relFilename);
		return "product/productview";
	}
	
	@RequestMapping("/wishlist/deleteWishList.do")
	public String deleteWishList(HttpServletRequest request) {
		String id = request.getParameter("id");
		int no = Integer.parseInt(request.getParameter("no"));
		String tag = request.getParameter("tag");
		String proStatus = request.getParameter("proStatus");
		String region = request.getParameter("region");
		//System.out.println(tag);
		//System.out.println(id);
		//System.out.println(no);
		String name = request.getParameter("name");
		//상품가져오기
		Product product = pservice.productCheck(no);
		//System.out.println("상품정보 가져온거 : "+product);
		List<String> filename = new ArrayList();
		for(int i=0; i<product.getFiles().size(); i++) {
			filename.add(product.getFiles().get(i).getRenameFilename());
		}
		
		
		//관련상품 가져오기
		Map param = new HashMap();
		String proContent = product.getProContent();//관련상품에 상세페이지에 보이는 상품은 뺴야하므로 db에서 제외시키기 위해 받아옴
		//String title = result.getTitle();
		param.put("proContent", proContent);
		param.put("tag", tag);
		
		List<Product> relProduct = pservice.relProduct(param);
		List<Files> relFiles = new ArrayList();
		//System.out.println("관련상품 : "+relProduct);
		for(int i=0; i<relProduct.size(); i++) {
			relFiles.addAll(relProduct.get(i).getFiles());
		}
		//관련상품 이미지
		List<String> relFilename = new ArrayList();
		for(int i=0; i<relFiles.size(); i++) {
			relFilename.add(relFiles.get(i).getRenameFilename());
		}
		//System.out.println("관련상품 이미지 파일 : "+relFilename);
		
		
		//관심상품 삭제 부분
		int result = service.deleteWishlist(id,no);
		int count = 1;
		if(result>0) {
			count = 0;
		}
		
		request.setAttribute("count",count);
		request.setAttribute("id", id);
		request.setAttribute("no", no);
		request.setAttribute("tag",tag);
		request.setAttribute("result", product);
		request.setAttribute("filename", filename);
		request.setAttribute("name",name);
		request.setAttribute("region", region);
		request.setAttribute("proStatus", proStatus);
		request.setAttribute("relProduct",relProduct);
		request.setAttribute("relFilename", relFilename);
		return "product/productview";
	}
	
	//찜목록 선택삭제
	@RequestMapping("/wishlist/deleteDibs.do")
	public String deleteDibs(HttpServletRequest request,
							RedirectAttributes ra,
							Model m) {
		try {
			String wishNo = request.getParameter("dibsList");
			String userId = request.getParameter("userId");
			List<WishList> wishList = new ArrayList();
			String[] result = wishNo.split(",");
			for(int i=0; i<result.length; i++) {
				wishList.add(service.findByWishId(Integer.parseInt(result[i])));
			}
			service.deleteWishListAll(wishList);
			ra.addAttribute("userId",userId);
		}catch(NullPointerException e) {
			
		}
		return "redirect:/member/wishList.do";
	}
	
	
	//마이페이지에서 찜선택 삭제
	@RequestMapping("/wishlist/deleteWish.do")
	public String deleteWish(@RequestParam("id") String id, @RequestParam("no") int no ,Model model) {
		Product p = Product.builder().proNo(no).build();
		Member m = Member.builder().userId(id).build();
		int result = service.deleteWishlist(id, no);
		//System.out.println("어떻게 찍히나 : "+result);
		if(result>0) {
			model.addAttribute("msg","관심 상품 해제가 완료되었습니다.");
			model.addAttribute("loc", "member/mypage.do");
		}else {
			model.addAttribute("msg","관심 상품 해제에 실패하였습니다 다시시도해주세요.");
			model.addAttribute("loc","member/mypage.do");
		}
		return "common/exception";
	}
}
