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
	
}
