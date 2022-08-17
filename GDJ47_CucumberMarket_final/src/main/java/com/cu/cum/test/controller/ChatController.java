package com.cu.cum.test.controller;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cu.cum.member.model.vo.Member;
import com.cu.cum.product.model.service.ProductService;
import com.cu.cum.product.model.vo.Product;
import com.cu.cum.product.model.vo.Review;
import com.cu.cum.test.model.vo.ChatRoom;
import com.cu.cum.test.model.vo.MessageContent;
import com.cu.cum.test.service.ChatService;

@Controller
public class ChatController {
		@Autowired
		private ChatService service;
		
		@Autowired
		private ProductService pservice;
	
		
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
	    		Product product = pservice.selectProduct(roomId);
	    		int lastindex= message.size()-1;
	    		
	    		if(!message.get(lastindex).getUserid().equals(userid)) {
	    			System.out.println("마지막메세지 보낸사람: "+message.get(lastindex).getUserid());
	    			service.updateroomreadcount(room.getRoomId());
		    		System.out.println(message);
		    		mv.addObject("product",product);
			    	mv.addObject("msg",message);
			    	mv.addObject("room",room);
			    	mv.setViewName("test/test3");
			    	return mv;
	    		}
	    		mv.addObject("product",product);
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
				 System.out.println("방생성");
				 service.createMessage(chatingRoom);
				 System.out.println("메세지삽입");
				 return chatingRoom;
			}
			
			
		}
	    
	    @ResponseBody
	    @PostMapping("/testreview")
	    public Review gotoReview(@RequestBody ChatRoom c){
	    	
	    	int result = pservice.updateProductSolve(c.getProNo());
	    	if(result>0) {
	    		return Review.builder().host(c.getUserId()).product(Product.builder().proNo(c.getProNo()).build()).build();
	    		
	    	}
	    	
	    	return null;
	    		
	    }
	    @GetMapping("/testreview2/{host}/{proNo}")
	    public ModelAndView gotoReview2(@PathVariable String host,@PathVariable int proNo
	    		,ModelAndView mv) {
	    	System.out.println(host+proNo);
	    	mv.addObject("host",host);
	    	mv.addObject("proNo",proNo);
	    	mv.setViewName("test/testt4");
	    	return mv;
	    }
}
