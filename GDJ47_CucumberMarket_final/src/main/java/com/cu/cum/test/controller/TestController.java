package com.cu.cum.test.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cu.cum.product.model.vo.Product;
import com.cu.cum.session.ChatSession;
import com.cu.cum.test.service.TestService;

@Controller
public class TestController {
	
	@Autowired
	private TestService service;
	@Autowired
	private ChatSession cSession;
	
	/*
	 * @RequestMapping("/testchat.do") public String testchat() {
	 * System.out.println(cSession); return "test/test3"; }
	 */
	@RequestMapping("/testchat2.do")
	public String testchat2() {
		System.out.println(cSession);
		return "test/test4";
	}
	
	@RequestMapping("/testpro")
	public String testpro() {
		return "test/test";
	}
	@RequestMapping("/test/testview/{id}")
	public ModelAndView selectpro(@PathVariable int id,ModelAndView mv) {
		Product p = service.selectproduct(id);
		System.out.println(p);
		mv.addObject("pro", p);
		mv.setViewName("test/test2");
		return mv;
		
		
	}
	
	
	@GetMapping("/testpro2")
	public ModelAndView getProduct(ModelAndView mv){
		List<Product> p = service.findAll();
		System.out.println(p);
		mv.addObject("product",p);
		mv.setViewName("test/test");
		return mv;
	}
}
