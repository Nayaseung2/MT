package com.kh.mt.adminServer;

import java.util.HashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class EchoHandler extends TextWebSocketHandler  {
	
	private HashMap<String, WebSocketSession> sessionList = new HashMap<String, WebSocketSession>();
	
	public EchoHandler(){}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		String[] msg = message.getPayload().split("/");
		
		sessionList.put(msg[0], session);
		
		sessionList.get("admin").sendMessage(new TextMessage(message.getPayload()));
		
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		
		if(sessionList.containsValue(session)){
			String result = (String) getKey(sessionList, session);
			sessionList.remove(result);
		}
		
		
	}
	
	public String getKey(HashMap<String, WebSocketSession> sessionList, WebSocketSession value) { 
		for(String key: sessionList.keySet()) {
			if(sessionList.get(key).equals(value)) {
				return key; 
			} 
		} 
		return null; 
	}

}
