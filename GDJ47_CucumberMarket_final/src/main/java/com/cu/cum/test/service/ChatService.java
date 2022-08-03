package com.cu.cum.test.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.cu.cum.test.dao.ChatDao;
import com.cu.cum.test.model.vo.ChatRoom;
import com.cu.cum.test.model.vo.MessageContent;

@Service
@Component
public class ChatService {
	
	@Autowired
	private ChatDao dao;
	
	@Autowired
	private SqlSessionTemplate session;
	
	public int createChatRoom(ChatRoom c) {
		return  dao.createChatRoom(session,c);
		
	}
	public int checkroom(ChatRoom c) {
		return dao.checkroom(session,c);
	}
	public ChatRoom selectChatRoom(ChatRoom c) {
		return dao.selectChatRoom(session,c);
	}
	public int createMessage(String id) {
		return dao.createMessage(session,id);
	}
	public ChatRoom selectRoomId(String id) {
		return dao.selectRoomId(session,id);
	}
	public int insertmessage(MessageContent message) {
		return dao.insertmessage(session,message);
	}
	public List<MessageContent> selectMessage(String roomid) {
		return dao.selectMessage(session,roomid);
	}
	public List<ChatRoom> selectChatList(String id){
		return dao.selectChatList(session,id);
		
	}
	public int roomInCheck(String otherId) {
		return dao.roomInCheck(session,otherId);
	}
	
	
	
	//리드카운트 1->0
	public int updateroomreadcount(String id) {
		return dao.updateroomreadcount(session,id);
	}
	//읽지않은 메세지 개수 구하기 
	public int unreadmessage(ChatRoom c) {
		return dao.unreadmessage(session, c);
	}
	public int unreadmessage2(ChatRoom c) {
		return dao.unreadmessage2(session, c);
	}
	//방 리드카운드 0->1
	
	public int updateroom2(String roomid) {
		return dao.updateroom2(session,roomid);
			
		
	}
	
	
}
