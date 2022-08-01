package com.cu.cum.handler;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import com.cu.cum.test.model.vo.ChatMessage;
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
		service.insertmessage(message);
		template.convertAndSend("/sub/chat/room/"+message.getRoomId(),message);
	}
	
	@GetMapping(value="/chatlist/{id}")
	public ModelAndView chatlist(@PathVariable String id,ModelAndView mv){
		System.out.println(id);
		List<ChatRoom> chatList = service.selectChatList(id);
		System.out.println(chatList);
		mv.addObject("chatList", chatList);
		mv.setViewName("test/test5");
		return mv;
	}
	
	
}
