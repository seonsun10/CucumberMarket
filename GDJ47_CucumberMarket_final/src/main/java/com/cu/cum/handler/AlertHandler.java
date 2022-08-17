package com.cu.cum.handler;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
@Component
public class AlertHandler extends TextWebSocketHandler{

	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	HashMap<String, WebSocketSession> sessionMap = new HashMap<>(); //웹소켓 세션을 담아둘 맵

	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
		// 모든 유저에게 보내기
		String msg = message.getPayload();
		if(msg != null) {
			String[] strs = msg.split(",");
			log(strs.toString());
			if(strs != null && strs.length == 4) {
				String type = strs[0];
				String target = strs[1]; // userid 저장
				String content = strs[2];
				String url = strs[3];
				WebSocketSession targetSession = users.get(target);  // 메시지를 받을 세션 조회
				
				// 실시간 접속시
				if(targetSession!=null) {
					// ex: 구매 요청이 들어왔습니다.
					TextMessage tmpMsg = new TextMessage("<a target='_blank' href='"+ url +"'>[<b>" + type + "</b>] " + content + "</a>" );
					targetSession.sendMessage(tmpMsg);
				}
			}
		}
	}
	// 에러 발생시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		log(session.getId() + " 익셉션 발생: " + exception.getMessage());

	}
	// 로그 메시지
	private void log(String logmsg) {
		System.out.println(new Date() + " : " + logmsg);
	}
	private String getMemberId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		String userid = (String) httpSession.get("userid"); // 세션에 저장된 userid 기준 조회
		return userid==null? null: userid;
	}
}
