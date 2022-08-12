package com.cu.cum.product.controller;


import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.service.FilesService;
import com.cu.cum.product.model.service.ProductService;
import com.cu.cum.product.model.service.ReviewService;
import com.cu.cum.product.model.vo.Files;
import com.cu.cum.product.model.vo.Product;
import com.cu.cum.product.model.vo.Review;
import com.cu.cum.wishlist.model.vo.WishList;

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
			@RequestParam("proContent") String proContent, RedirectAttributes ra,
			@RequestParam("tag") String tag , @RequestParam("proStatus") String proStatus,
			@RequestParam(name="price") int price , @RequestParam(name="userId") String userId, HttpServletRequest rs) {
		//String userId = "admin@naver.com"; //나중엔 세션값으로 email 불러와야함
		//String userId = email.substring(0, email.indexOf("@"));
		//파일제외 나머지 insert문
		
		String region = sido+" "+gugun;
		Member m = Member.builder().userId(userId).build();
		p = Product.builder().title(proName).proContent(proContent).price(price).
				region(region).categoryName(tag).proStatus(proStatus).member(m).
				build();
		
		Product product = service.insertProduct(p); //productdao
		
		//파일 업로드 처리하고 db에 insert문처리
		List<MultipartFile> fileList = mtfRequest.getFiles("image"); //나머지 이미지 3개
		MultipartFile thumbnail = mtfRequest.getFile("image1"); //썸네일 이미지 1개
		System.out.println(fileList);
		//System.out.println(upFile);
		String path = mtfRequest.getServletContext().getRealPath("/resources/upload/product/");
		File uploadDir = new File(path);
		if(!uploadDir.exists()) uploadDir.mkdirs();
		List<Files> files = new ArrayList();
		//썸네일 이미지 처리
		String originalFilename1 = thumbnail.getOriginalFilename();
//		류원희.txt
//		ext = .txt
//		
//		123123+ext
//		123123.txt
		String ext = originalFilename1.substring(originalFilename1.lastIndexOf("."));
		int rndNum=(int)(Math.random()*10000);
		String rename = "s_"+userId+"_"+rndNum+ext;
		try {
			thumbnail.transferTo(new File(path+rename));
			files.add(Files.builder()
					.product(p)
					.member(m)
					.originalFilename(originalFilename1)
					.renameFilename(rename)
					.thumbnailStatus("y")
					.build());
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		//나머지 이미지 처리
		if(fileList!=null) {
			for(MultipartFile f : fileList) {
					if(f!=null) {
						String originalFilename2 = f.getOriginalFilename();
						if(originalFilename2!=null) {
							System.out.println(originalFilename2);
							System.out.println("아래꺼 : "+originalFilename2.lastIndexOf("."));
							String extt = originalFilename2.substring(originalFilename2.lastIndexOf("."));
							
							rndNum=(int)(Math.random()*10000);
							String rename1 = userId+"_"+rndNum+extt;
							try {
								f.transferTo(new File(path+rename1));
								files.add(Files.builder()
									.product(p)
									.member(m)
									.originalFilename(originalFilename2)
									.thumbnailStatus("n")
									.renameFilename(rename1).build());
							}catch(IOException e) {
								e.printStackTrace();
							}
						}
					}
			}
		}		
					


		List<Files> f = fService.insertFiles(files);
		System.out.println(f);
		ra.addAttribute("userId",userId);
		return "redirect:/member/mypage.do";
	}
	
	//거래 후기
	@RequestMapping("/product/productReview.do")
	public String productReview(@RequestParam(defaultValue="0") int proNo,
								
								@RequestParam(defaultValue ="5") int oi,
								@RequestParam(defaultValue="0") String host,//상품 주인
								@RequestParam(defaultValue ="짱이에요") String ment,
								Model m) {
		if(proNo==0) {m.addAttribute("msg","등록실패");}
		else {
			String userid= ((Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUserId();
			Product p = service.selectProduct(proNo);
			log.debug("{}",p);
	//		p.setReview(Review.builder().proNo(proNo).writer(writer).oi(oi).build());
			Review rv = Review.builder().writeDate(new Date()).product(Product.builder().proNo(proNo).build()).ment(ment).host(host).writer(userid).oi(oi).build();
			log.debug("rv는 무엇인가 : "+rv);
			try {
				rvservice.insertReview(rv);
				m.addAttribute("msg","등록성공");
				m.addAttribute("script","zz");
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
								@RequestParam String userId,
								HttpServletRequest mtfRequest,
								Model m) {
		System.out.println(proNo);
		System.out.println(userId);
		Product p = Product.builder().proNo(proNo).build();
		List<Files> files = service.selectFiles(p);
		List<String> filename = new ArrayList();
		System.out.println("files : "+files);
		String path = mtfRequest.getServletContext().getRealPath("/resources/upload/product/");
		for(int i=0; i<files.size(); i++) {
			filename.add(files.get(i).getRenameFilename());
			File f = new File(path+filename.get(i));
			if(f.exists()) f.delete();
		}
		m.addAttribute("loc","member/mypage.do");
		try {
			List<Product> result=service.deleteProduct(proNo);
			m.addAttribute("msg","삭제 성공");
		}catch(Exception e) {
			m.addAttribute("msg","삭제 실패");
			
//			e.printStackTrace();
		}
		return "common/msg";
	}
	
	
	
	
	//카테고리별 상품 결과
	@RequestMapping("/product/productTotal.do")
	public String productTotal(@RequestParam("tag") String tag,
								@RequestParam(defaultValue="1") int cPage,
								@RequestParam(defaultValue="200") int numPerpage,
								Model m) throws Exception{
		System.out.println(tag);
		List<Product> products = service.findAllByCategoryName(PageRequest.of((cPage-1)*numPerpage, numPerpage,Sort.by("enrollDate").descending()), tag);
		List<Long> daylist = new ArrayList();
		List<Files> tfn = new ArrayList();
//		pro_no=일치 and thumbnail_status='y';
		List<String> renames = new ArrayList();
		for(Product p : products) {
	       LocalDate today=LocalDate.now();
	       LocalDate targetDay=new java.sql.Date(p.getEnrollDate().getTime()).toLocalDate();
	       Long day= ChronoUnit.DAYS.between(today, targetDay);
	       log.debug("{}",Math.abs(day));
	       daylist.add(Math.abs(day));
	       tfn.addAll(p.getFiles());
	    }
		for(Files f : tfn) {
			if(f.getRenameFilename().contains("s_")) {
				renames.add(f.getRenameFilename());
			}
		}
		System.out.println(renames);
		m.addAttribute("renames",renames);
		m.addAttribute("productCount",service.selectCategoryCount(tag));
		m.addAttribute("product",products);
		m.addAttribute("tag",tag);
		m.addAttribute("daylist",daylist);
		return "product/productTotal";
	}
	
	
	
	@RequestMapping("/product/insertProductStart.do")
	public String insertProductStart() {
		return "product/insertProduct";
	}
	
	
	//상품 상세페이지
	@RequestMapping("/product/productView.do")
	public String productView(HttpServletRequest request) {
		String id = request.getParameter("id");
		int no = Integer.parseInt(request.getParameter("no"));
		String tag = request.getParameter("tag");
		String name = request.getParameter("name");
		String proStatus = request.getParameter("proStatus");
		String region = request.getParameter("region");
		System.out.println(id+" "+no+" "+tag);
		Member m = Member.builder().userId(id).build();
		Product p = Product.builder().proNo(no).build();
		
		//상품상세페이지에 가져갈 상품 가져오기
		Product result = service.productCheck(no);
		System.out.println("상품정보 가져온거 : "+result);
		List<String> filename = new ArrayList();
		for(int i=0; i<result.getFiles().size(); i++) {
			filename.add(result.getFiles().get(i).getRenameFilename());
		}
		//System.out.println("상품이 가지고 있는 이미지 파일 이름들 : "+filename);
		
		//상품상세페이지에서 관심상품인지 아닌지 체크하기
		int count = 0;
		WishList wl = service.checkWishlist(m,p);
		if(wl!=null) {
			count = 1;
		}
		System.out.println("관심상품 등록되어있으면 1 없으면 0 출력 : "+count);
		
		//관련상품 리스트 출력
		Map param = new HashMap();
		String proContent = result.getProContent();//관련상품에 상세페이지에 보이는 상품은 뺴야하므로 db에서 제외시키기 위해 받아옴
		//String title = result.getTitle();
		param.put("proContent", proContent);
		param.put("tag", tag);
		
		List<Product> relProduct = service.relProduct(param);
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
		
		
		
		request.setAttribute("count",count);
		request.setAttribute("id", id);
		request.setAttribute("no", no);
		request.setAttribute("tag",tag);
		request.setAttribute("result", result);
		request.setAttribute("filename", filename);
		request.setAttribute("name", name);
		request.setAttribute("region", region);
		request.setAttribute("proStatus", proStatus);
		request.setAttribute("relProduct",relProduct);
		request.setAttribute("relFilename", relFilename);
		return "product/productview";
	}
	
	//상품 검색
	@RequestMapping("/product/searchProduct.do")
	public String searchProduct(@RequestParam String keyword,
								Model m) {
		System.out.println(keyword);
		List<Product> result = service.searchProduct(keyword);
		List<String> renames = new ArrayList();
		List<Files> files = new ArrayList();
		for(Product p : result) {
			files.addAll(p.getFiles());
		}
		for(Files f : files) {
			if(f.getRenameFilename().contains("s_")) {
				renames.add(f.getRenameFilename());
			}
		}
		m.addAttribute("productCount",result.size());
		m.addAttribute("renames",renames);
		m.addAttribute("product",result);
		return "product/productTotal";
	}
}
