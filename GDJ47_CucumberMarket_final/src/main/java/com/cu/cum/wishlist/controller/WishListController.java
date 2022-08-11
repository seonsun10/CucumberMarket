package com.cu.cum.wishlist.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String insertWishList(HttpServletRequest request,Model model) {
		String id = request.getParameter("id");
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(id);
		System.out.println(no);
		String tag = request.getParameter("tag");
		String name = request.getParameter("name");
		System.out.println(tag);
		Product p = Product.builder().proNo(no).build();
		Member m = Member.builder().userId(id).build();
		
		//상품 부분
		Product product = pservice.productCheck(no);
		System.out.println("상품정보 가져온거 : "+product);
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
		System.out.println("관련상품 이미지 파일 : "+relFilename);
		
		//위시리스트 부분
		WishList wl = WishList.builder().member(m).product(p).build();
		int checkresult = service.checkidWishlist(session,wl);
		System.out.println(wl);
		int count;
		
		if(checkresult>0) {
			count=0;
		}else {
			WishList result = service.insertWishlist(wl);
			count=1;
		}

		request.setAttribute("count",count);
		request.setAttribute("id", id);
		request.setAttribute("no", no);
		request.setAttribute("tag",tag);
		request.setAttribute("result", product);
		request.setAttribute("filename", filename);
		request.setAttribute("name", name);
		request.setAttribute("relProduct",relProduct);
		request.setAttribute("relFilename", relFilename);
		return "product/productview";
	}
	
	@RequestMapping("/wishlist/deleteWishList.do")
	public String deleteWishList(HttpServletRequest request) {
		String id = request.getParameter("id");
		int no = Integer.parseInt(request.getParameter("no"));
		String tag = request.getParameter("tag");
		System.out.println(tag);
		System.out.println(id);
		System.out.println(no);
		String name = request.getParameter("name");
		//상품가져오기
		Product product = pservice.productCheck(no);
		System.out.println("상품정보 가져온거 : "+product);
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
		System.out.println("관련상품 이미지 파일 : "+relFilename);
		
		
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
		request.setAttribute("relProduct",relProduct);
		request.setAttribute("relFilename", relFilename);
		return "product/productview";
	}
	
	//찜목록 선택삭제
	@RequestMapping("/wishlist/deleteDibs.do")
	public String deleteDibs(HttpServletRequest request,
							Model m) {
		String msg = "";
		try {
			String[] wishNo = request.getParameterValues("dibsList");
			List<WishList> wishList = new ArrayList();
			for(int i=0; i<wishNo.length; i++) {
				wishList.add(service.findByWishId(Integer.parseInt(wishNo[i])));
			}
			service.deleteWishListAll(wishList);
		}catch(NullPointerException e) {
		}
		return "redirect:/";
	}
}
