package com.cu.cum.area.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cu.cum.area.model.service.AreaService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class AreaController {
	
	@Autowired
	private AreaService service;
	
	@RequestMapping("/area.do")
	public String area() {
		return "area/testarea";
	}
	
	@RequestMapping("/testarea.do")
	public String testArea(@RequestParam("address") String address) {
		log.debug(address+" 입니다.");
		String[] addr = address.split(" ");
		String addr1 = ""; //시도
		String addr2 = ""; //시군구
		for(int i=0; i<2; i++) {
			addr1 = addr[0];
			addr2 = addr[1];
		}
		System.out.println("이건 시/도 야 : "+addr1);
		System.out.println("이건 시/군/구 야 : "+addr2);
		return "area/testarea"; //그러면 이제 여기에 이 주소에 해당하는 물품으로 
	}
	
}
