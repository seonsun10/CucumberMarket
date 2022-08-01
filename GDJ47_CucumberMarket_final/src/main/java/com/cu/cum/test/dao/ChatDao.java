package com.cu.cum.test.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.cu.cum.test.model.vo.ChatRoom;
import com.cu.cum.test.model.vo.MessageContent;

@Repository
public class ChatDao {
	
	
	public int createChatRoom(SqlSessionTemplate session,ChatRoom c) {
		return session.insert("chatroom.insertchatroom",c);
	}
	public int checkroom(SqlSessionTemplate session,ChatRoom c) {
		return session.selectOne("chatroom.checkroom",c);
	}
	public ChatRoom selectChatRoom(SqlSessionTemplate session,ChatRoom c) {
		return session.selectOne("chatroom.selectchatroom",c);
	}
	public int createMessage(SqlSessionTemplate session,String id) {
		return session.insert("chatroom.insertmessage1",id);
	}
	public ChatRoom selectRoomId(SqlSessionTemplate session,String id) {
		return session.selectOne("chatroom.selectroomid",id);
	}
	public int insertmessage(SqlSessionTemplate session,MessageContent message) {
		return session.insert("chatroom.insertmessage",message);
	}
	public List<MessageContent> selectMessage(SqlSessionTemplate session,String roomid){
		return session.selectList("chatroom.selectmessage",roomid);
	}
	public List<ChatRoom> selectChatList(SqlSessionTemplate session,String id){
		return session.selectList("chatroom.selectchatlist",id);
	}
}
