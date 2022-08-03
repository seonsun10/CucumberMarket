package com.cu.cum.test.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cu.cum.member.model.vo.Member;
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
	    //판매중일때 대화방
	    @GetMapping("/ptestchat.do/{roomId}")
	    public ModelAndView openchat2(@PathVariable String roomId,ModelAndView mv) {
	    	System.out.println(roomId);
	    	String userid= ((Member)SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getUserId();
	    	System.out.println(userid);
	    	ChatRoom room = service.selectRoomId(roomId);
	    	System.out.println(room.getOtherId());
	    	if(!userid.equals(room.getOtherId())) {
	    		System.out.println("진입");
	    		List<MessageContent> message = service.selectMessage(roomId);
	    		int lastindex= message.size()-1;
	    		if(!message.get(lastindex).getUserid().equals(userid)) {
	    			System.out.println("마지막메세지 보낸사람: "+message.get(lastindex).getUserid());
	    			service.updateroomreadcount(room.getRoomId());
		    		System.out.println(message);
			    	
			    	mv.addObject("msg",message);
			    	mv.addObject("room",room);
			    	mv.setViewName("test/test3");
			    	return mv;
	    		}
	    		mv.addObject("msg",message);
		    	mv.addObject("room",room);
		    	mv.setViewName("test/test3");
		    	return mv;
	    		
	    	}else {
	    		System.out.println("리트카운트x");
	    		System.out.println("구매자진입");
	    		List<MessageContent> message = service.selectMessage(room.getRoomId());
	    		int lastindex= message.size()-1;
	    		if(!message.get(lastindex).getUserid().equals(userid)) {
	    			System.out.println("마지막메세지 보낸사람: "+message.get(lastindex).getUserid());
	    			service.updateroomreadcount(room.getRoomId());
		    		System.out.println(message);
			    	
			    	mv.addObject("msg",message);
			    	mv.addObject("room",room);
			    	mv.setViewName("test/test3");
			    	return mv;
	    		}
		    	
		    	mv.addObject("msg",message);
		    	mv.addObject("room",room);
		    	mv.setViewName("test/test3");
		    	return mv;
	    	}
	    	
	 
	    }
	    @GetMapping("/testchat.do/{roomId}")
	    public ModelAndView openchat3(@PathVariable String roomId,ModelAndView mv) {
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
	    	if(c.getUserId().equals(c.getOtherId())) {
	    		return c;
	    	}
	    	String roomNumber = UUID.randomUUID().toString();
	    	ChatRoom chatingRoom = ChatRoom.builder()
					.roomId(roomNumber).userId(c.getUserId()).otherId(c.getOtherId()).proNo(c.getProNo())
					.build();
			int checkroom = service.checkroom(c); // 판매자와 구매자사이의 존재하는 채팅방이 있는지 확인 
			if(checkroom>=1) {
				return service.selectChatRoom(chatingRoom); 
			}else {
				
				 service.createChatRoom(chatingRoom);
				 service.createMessage(chatingRoom.getRoomId());
				 
				 return chatingRoom;
			}
			
			
		}
}
