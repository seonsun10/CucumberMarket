package com.cu.cum.product.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.service.ProductService;
import com.cu.cum.product.model.vo.Product;
import com.cu.cum.product.model.vo.Review;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	@RequestMapping("/product/insertProduct.do")
	public String insertProduct(@RequestParam("image") String image,@RequestParam("proName") String proName , @RequestParam("region") String region,
			@RequestParam("proContent") String proContent, 
			@RequestParam("tag") String tag , @RequestParam("proStatus") String proStatus,
			@RequestParam(name="price") int price ) {
		log.debug(image);
		log.debug(proName);
		log.debug(region);
		log.debug(proContent);
		log.debug(tag);
		log.debug(proStatus);
		//int pri = Integer.parseInt(request.getParameter("price"));
		System.out.println(price);
		Member m = Member.builder().userId("manager").build();
		Product p = Product.builder().proName(proName).proContent(proContent).price(price).
				region(region).categoryName(tag).proStatus(proStatus).member(m).
				build();
		
		Product result = service.insertProduct(p);
		
		return "member/mypage";
	}
	
	//거래 후기
	@RequestMapping("/product/productReview.do")
	public String productReview(@RequestParam int proNo,
								@RequestParam String writer,
								@RequestParam int oi,
								Model m) {
		int review = service.insertReview(Review.builder().proNo(proNo).writer(writer).oi(oi).build());
		if(review>0)m.addAttribute("msg","등록성공");
		else m.addAttribute("msg","등록실패");
		return "common/msg";
	}
	
	//상품 삭제
	@RequestMapping("/product/deleteProduct.do")
	public String deleteProduct(@RequestParam int proNo,
								Model m) {
		try {
			service.deleteProduct(proNo);
			m.addAttribute("msg","삭제 성공");
		}catch(Exception e) {
			m.addAttribute("msg","삭제 실패");
		}
		return "common/msg";
	}
	
}
