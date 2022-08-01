package com.cu.cum.test.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cu.cum.test.model.vo.ChatMessage;
import com.cu.cum.test.model.vo.ChatRoom;
import com.cu.cum.test.model.vo.MessageContent;
import com.cu.cum.test.service.ChatService;

@Controller
public class ChatController {
		@Autowired
		private ChatService service;
	
		@ResponseBody
	 	@MessageMapping("/chat.sendMessage")
	    @SendTo("/topic/public")
	    public ChatMessage sendMessage(@Payload ChatMessage chatMessage) {
	        return chatMessage;
	    }

		
	    @MessageMapping("/chat.addUser")
	    @SendTo("/topic/public")
	    public ChatMessage addUser(@Payload ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor){
	        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
	        return chatMessage;
	    }
	    
	    @GetMapping("/testchat.do/{roomId}")
	    public ModelAndView openchat2(@PathVariable String roomId,ModelAndView mv) {
	    	System.out.println(roomId);
	    	ChatRoom room = service.selectRoomId(roomId);
	    	List<MessageContent> message = service.selectMessage(roomId);
	    	System.out.println(message);
	    	
	    	mv.addObject("msg",message);
	    	mv.addObject("room",room);
	    	mv.setViewName("test/test3");
	    	
	    	return mv;
	    	
	    }
	    
	    @ResponseBody
	    @PostMapping("/chatingRoom")
		public ChatRoom chatingRoom(@RequestBody ChatRoom c) {
	    	System.out.println("통신성공");
	    	System.out.println(c);
	    	String roomNumber = UUID.randomUUID().toString();
	    	ChatRoom chatingRoom = ChatRoom.builder()
					.roomId(roomNumber).userId(c.getUserId()).otherId(c.getOtherId()).proNo(c.getProNo())
					.build();
			int checkroom = service.checkroom(c);
			if(checkroom>=1) {
				System.out.println(chatingRoom);
				return service.selectChatRoom(chatingRoom);
			}else {
				
				
				System.out.println(chatingRoom);
				 service.createChatRoom(chatingRoom);
				 service.createMessage(chatingRoom.getRoomId());
				 
				 return chatingRoom;
			}
			
			
		}
}
