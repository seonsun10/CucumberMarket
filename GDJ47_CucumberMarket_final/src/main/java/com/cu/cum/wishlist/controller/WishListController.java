package com.cu.cum.wishlist.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.vo.Product;
import com.cu.cum.wishlist.model.service.WishListService;
import com.cu.cum.wishlist.model.vo.WishList;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class WishListController {
	
	@Autowired
	private WishListService service;
	
	@RequestMapping("/product/productView.do")
	public String productView(HttpServletRequest request) {
		String id = request.getParameter("id");
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(id+" "+no);
		Member m = Member.builder().userId(id).build();
		Product p = Product.builder().proNo(no).build();
		int count = 0;
		WishList wl = service.checkWishlist(m,p);
		if(wl!=null) {
			count = 1;
		}
		System.out.println(count);
		request.setAttribute("count",count);
		request.setAttribute("id", id);
		request.setAttribute("no", no);
		return "product/productview";
	}
	
	
	@RequestMapping("/product/insertWish.do")
	public String insertWishList() {
		return "";
	}

	@RequestMapping("/wishlist/deleteWishList.do")
	public String deleteWishList(HttpServletRequest request) {
		String id = request.getParameter("id");
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(id);
		System.out.println(no);
		Member m = Member.builder().userId(id).build();
		Product p = Product.builder().proNo(no).build();
		//int count = service.deleteWishlist(m,p);
//		if(wl!=null) {
//			count = 1;
//		}
		
		//request.setAttribute("count", count);
		request.setAttribute("id", id);
		request.setAttribute("no", no);
		return "product/productview";
	}
}
