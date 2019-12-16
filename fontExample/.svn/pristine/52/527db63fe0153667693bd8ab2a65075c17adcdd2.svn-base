package com.icia.fontExample.Controller.RestController;

import java.util.*;

import org.springframework.web.socket.*;
import org.springframework.web.socket.handler.*;

public class talkService extends TextWebSocketHandler {
	// ArrayList는 다중 작업에서 안전하지 않다 -> 대신 속도가 빠르다
	// Vector는 다중 작업시 한번에 한 객체씩 동작을 보장(안전)
	List<WebSocketSession> list = new Vector<WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		// 새로운 연결이 만들어 지면
		System.out.println("새로운 연결 추가 : " + session);
		list.add(session);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session,CloseStatus status) throws Exception{
		// 연결이 끊어지면 (클라이언트 화면 이동)
		System.out.println("연결 제거 : " + session);
		list.add(session);
	}
	@Override
	public void handleMessage(WebSocketSession session,WebSocketMessage<?> message) throws Exception{
		// 메세지를 전송
		for (WebSocketSession ws : list) {
			ws.sendMessage(message);
		}
	}
}
