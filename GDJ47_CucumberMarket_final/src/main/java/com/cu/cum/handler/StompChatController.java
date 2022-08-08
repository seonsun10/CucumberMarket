package com.cu.cum.handler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.cu.cum.member.model.vo.Member;
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
	
	@MessageMapping(value="/chat/message")
	public void message(MessageContent message) {
		int result =service.insertmessage(message);
		int updateroom= service.updateroom2(message.getRoomId()); 
		
		template.convertAndSend("/sub/chat/room/"+message.getRoomId(),message);
	}
	
	@GetMapping(value="/chatlist/{id}")
	public ModelAndView chatlist(@PathVariable String id,ModelAndView mv){
		System.out.println(id);
		String userid= ((Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUserId();
		
		
		List<ChatRoom> chatList = service.selectChatList(id);
			
		for(ChatRoom c:chatList) {
			if(c.getUserId().equals(userid)) {
			c.setUnReadCount(service.unreadmessage(c));
			}else {
			c.setUnReadCount(service.unreadmessage2(c));
			}
			
		}
		
		System.out.println(chatList);
		mv.addObject("chatList", chatList);
		mv.setViewName("member/mypageGchat");
		
		return mv;
	}
	@GetMapping(value="/chatlist2/{id}")
	public ModelAndView chatlist2(@PathVariable String id,ModelAndView mv){
		System.out.println("판매채팅창");
		System.out.println(id);
		String userid= ((Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUserId();
		
		
		List<ChatRoom> chatList = service.selectChatList(id);
			
		for(ChatRoom c:chatList) {
			if(c.getUserId().equals(userid)) {
			c.setUnReadCount(service.unreadmessage(c));
			}else {
			c.setUnReadCount(service.unreadmessage2(c));
			}
			
		}
		
		System.out.println(chatList);
		mv.addObject("chatList", chatList);
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
