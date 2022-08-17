package com.cu.cum.handler;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.service.FilesService;
import com.cu.cum.product.model.vo.Files;
import com.cu.cum.product.model.vo.Product;
import com.cu.cum.test.model.vo.ChatRoom;
import com.cu.cum.test.model.vo.MessageContent;
import com.cu.cum.test.service.ChatService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class StompChatController {

	private final SimpMessagingTemplate template;
	
	@Autowired
	private ChatService service;
	
	@Autowired
	private FilesService fservice;
	
	@MessageMapping(value="/chat/message")
	public void message(MessageContent message) {
		int result =service.insertmessage(message);
		int updateroom= service.updateroom2(message.getRoomId()); 
		
		template.convertAndSend("/sub/chat/room/"+message.getRoomId(),message);
	}
	
	@GetMapping(value="/chatlist/{id}")
	public ModelAndView chatlist(@PathVariable String id,ModelAndView mv, Model model){
		System.out.println(id);
		String userid= ((Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUserId();
		
		
		List<ChatRoom> chatList = service.selectChatList(id);
		List<Integer> chatPro = new ArrayList();
		for(int i=0; i<chatList.size(); i++) {
			if(chatList.get(i).getOtherId().equals(id)) {
			System.out.println("상품 번호 : "+chatList.get(i).getProNo());
			chatPro.add(chatList.get(i).getProNo());
			}
		}
		System.out.println("구매자가 가지고 있는 상품번호 : "+chatPro);
		List<Files> chatFile = new ArrayList();
		Product p = null;
		for(int i=0; i<chatPro.size(); i++) {
			p = Product.builder().proNo(chatPro.get(i)).build();
			chatFile.addAll(fservice.findByProduct(p));
		}
		System.out.println("chatFile : "+chatFile);
		List<String> chatFilename = new ArrayList();
		for(int i=0; i<chatFile.size(); i++) {
			if(chatFile.get(i).getRenameFilename().contains("s_")) {
				chatFilename.add(chatFile.get(i).getRenameFilename());
			}
		}
		System.out.println("진짜 마지막으로 구매자가 가지고 있는 상품 리네임파일이름 : "+chatFilename);
		for(ChatRoom c:chatList) {
			if(c.getUserId().equals(userid)) {
			c.setUnReadCount(service.unreadmessage(c));
			}else {
			c.setUnReadCount(service.unreadmessage2(c));
			}
			
		}
		
		System.out.println(chatList);
		mv.addObject("chatList", chatList);
		mv.addObject("chatFilename",chatFilename);
		mv.setViewName("member/mypageGchat");
		
		return mv;
	}
	@GetMapping(value="/chatlist2/{id}")
	public ModelAndView chatlist2(@PathVariable String id,ModelAndView mv){
		System.out.println("판매채팅창");
		System.out.println(id);
		String userid= ((Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUserId();
		
		
		List<ChatRoom> chatList = service.selectChatList2(id);
		System.out.println("chatList : "+chatList);
		List<Integer> chatPro = new ArrayList();
		for(int i=0; i<chatList.size(); i++) {
			if(chatList.get(i).getUserId().equals(id)) {
			System.out.println("상품 번호 : "+chatList.get(i).getProNo());
			chatPro.add(chatList.get(i).getProNo());
			}
		}
		System.out.println("판매자가 가지고 있는 상품번호 : "+chatPro);
		List<Files> chatFile = new ArrayList();
		Product p = null;
		for(int i=0; i<chatPro.size(); i++) {
			p = Product.builder().proNo(chatPro.get(i)).build();
			chatFile.addAll(fservice.findByProduct(p));
		}
		System.out.println("chatFile : "+chatFile);
		List<String> chatFilename = new ArrayList();
		for(int i=0; i<chatFile.size(); i++) {
			if(chatFile.get(i).getRenameFilename().contains("s_")) {
				chatFilename.add(chatFile.get(i).getRenameFilename());
			}
		}
		System.out.println("진짜 마지막으로 판매자가 가지고 있는 상품 리네임파일이름 : "+chatFilename);

		for(ChatRoom c:chatList) {
			if(c.getUserId().equals(userid)) {
			c.setUnReadCount(service.unreadmessage(c));
			}else {
			c.setUnReadCount(service.unreadmessage2(c));
			}
			
		}
		
		System.out.println(chatList);
		mv.addObject("chatList", chatList);
		mv.addObject("chatFilename",chatFilename);
		mv.setViewName("member/myPagePchat");
		
		return mv;
	}
	@GetMapping(value="/deletechatroom/{id}")
	public ModelAndView deleteChatRoom(@PathVariable String id,ModelAndView mv) {
		String userid= ((Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUserId();
		int result = service.deleteChatRoom(id);
		if(result>0) {
			mv.addObject("msg","채팅방삭제완료");
			mv.addObject("loc","member/mypage.do?userId="+userid);
			mv.setViewName("common/msg");
			return mv;
		}else {
			mv.addObject("msg","채팅방삭제실패");
			mv.addObject("loc","member/mypage.do?userId="+userid);
			mv.setViewName("common/msg");
			return mv;
		}
	}
	
	
}
