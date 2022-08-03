package com.cu.cum.product.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.service.FilesService;
import com.cu.cum.product.model.service.ProductService;

import com.cu.cum.product.model.vo.Files;

import com.cu.cum.product.model.service.ReviewService;

import com.cu.cum.product.model.vo.Product;

import com.cu.cum.product.model.vo.Review;


import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ProductController {
	
	@Autowired
	private ProductService service; //productService
	
	@Autowired
	private FilesService fService;
	
	@RequestMapping("/mypage.do")
	public String myPage() {
	
		return "member/mypage";
	}
	@Autowired
	private ReviewService rvservice;
	

	@RequestMapping("/product/insertProduct.do")
	public String insertProduct(Product p, MultipartHttpServletRequest mtfRequest ,@RequestParam("proName") String proName , 
			@RequestParam("sido1") String sido, @RequestParam("gugun1") String gugun,
			@RequestParam("proContent") String proContent,
			@RequestParam("tag") String tag , @RequestParam("proStatus") String proStatus,
			@RequestParam(name="price") int price , @RequestParam(name="userId") String userId) {
		//String userId = "admin@naver.com"; //나중엔 세션값으로 email 불러와야함
		//String userId = email.substring(0, email.indexOf("@"));
		//파일제외 나머지 insert문
		System.out.println(tag);
		
		String region = sido+" "+gugun;
		System.out.println(region);
		Member m = Member.builder().userId(userId).build();
		p = Product.builder().title(proName).proContent(proContent).price(price).
				region(region).categoryName(tag).proStatus(proStatus).member(m).
				build();
		
		Product product = service.insertProduct(p); //productdao
		
		//파일 업로드 처리하고 db에 insert문처리
		List<MultipartFile> fileList = mtfRequest.getFiles("image");
		System.out.println(fileList);
		String path = mtfRequest.getServletContext().getRealPath("/resources/upload/product/");
		File uploadDir = new File(path);
		if(!uploadDir.exists()) uploadDir.mkdirs();
		List<Files> files = new ArrayList();
		if(fileList!=null) {
			int index=0;
			for(MultipartFile f : fileList) {
				if(!f.isEmpty()) {
					if(index==0) { //대표이미지 썸네일
						String originalFilename = f.getOriginalFilename();
						String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
						int rndNum=(int)(Math.random()*10000);
						String rename = "s_"+userId+"_"+rndNum+ext;
						try {
							f.transferTo(new File(path+rename));
							files.add(Files.builder()
								.product(p)
								.member(m)
								.originalFilename(originalFilename)
								.renameFilename(rename).build());
						}catch(IOException e) {
							e.printStackTrace();
						}
						index++;
					}else { //나머지 이미지 
						String originalFilename = f.getOriginalFilename();
						String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
						int rndNum=(int)(Math.random()*10000);
						String rename = userId+"_"+rndNum+ext;
						try {
							f.transferTo(new File(path+rename));
							files.add(Files.builder()
								.product(p)
								.member(m)
								.originalFilename(originalFilename)
								.renameFilename(rename).build());
						}catch(IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
		}
		
		List<Files> f = fService.insertFiles(files);
		
		//Product product = service.insertProduct(p);
//		if(p!=null) {
//			System.out.println("파일이 들어갔다.");
//		}else {
//			System.out.println("파일이 들어가지 못함");
//		}
		
		return "redirect:/mypage.do";
	}
	
	//거래 후기
	@RequestMapping("/product/productReview.do")
	public String productReview(@RequestParam(defaultValue="0") int proNo,
								@RequestParam(defaultValue ="신원미상") String writer,
								@RequestParam(defaultValue ="5") int oi,
								@RequestParam(defaultValue ="짱이에요") String ment,
								Model m) {
		if(proNo==0) {m.addAttribute("msg","등록실패");}
		else {
			Product p = service.selectProduct(proNo);
			log.debug("{}",p);
	//		p.setReview(Review.builder().proNo(proNo).writer(writer).oi(oi).build());
			Review rv = Review.builder().product(p).ment(ment).host(p.getMember().getUserId()).writer(writer).oi(oi).build();
			log.debug("rv는 무엇인가 : "+rv);
			try {
				rvservice.insertReview(rv);
				m.addAttribute("msg","등록성공");
			}catch(Exception e) {
//				e.printStackTrace();
				m.addAttribute("msg","등록실패");			
			}
		}
//		Product result = service.insertReview(p);
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
	
	
	
	
	//카테고리별 상품 결과 나오게하는거 이란 임시용
	@RequestMapping("/product/productTotal.do")
	public String productTotal(@RequestParam("tag") String tag) {
		System.out.println(tag);
		return "/";
	}
	
}
