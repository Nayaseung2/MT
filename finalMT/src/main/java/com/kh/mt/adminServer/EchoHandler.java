package com.kh.mt.adminServer;

import java.util.HashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class EchoHandler extends TextWebSocketHandler {
	private HashMap<String, WebSocketSession> sessionList = new HashMap<String, WebSocketSession>();
	public EchoHandler(){}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
		System.out.println("채팅방 입장자: " + session.getId());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		String[] msg = message.getPayload().split("/");
		
		System.out.println(msg[0]);
		sessionList.put(msg[0], session);
		
		sessionList.get("admin").sendMessage(new TextMessage(message.getPayload()));
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		sessionList.remove(session);
		
		System.out.println("채팅방 퇴장자: " + session.getPrincipal().getName());
	}
}
