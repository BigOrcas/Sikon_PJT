package com.sikon.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.sikon.service.alarm.AlarmService;
import com.sikon.service.domain.Alarm;
import com.sikon.service.domain.User;


public class EchoHandler extends TextWebSocketHandler {
	
	///Field
	@Autowired
	@Qualifier("alarmServiceImpl")
	private AlarmService alarmService;
		
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ���� �Ұ�
	//==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	//�α��� �� �ο� ��ü
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1:1�� �� ���
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {//Ŭ���̾�Ʈ�� ������ ����
		
		System.out.println("Socket ����");
		sessions.add(session);
		System.out.println(currentUserName(session));//���� ������ ���
		String senderId = currentUserName(session);
		userSessionsMap.put(senderId, session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {// �޽���
		
		System.out.println("session"+currentUserName(session));
		String msg = message.getPayload();//�ڹٽ�ũ��Ʈ���� �Ѿ�� Msg
		System.out.println("msg="+msg);
		
		if (StringUtils.isNotEmpty(msg)) {
			System.out.println("if�� ����?");
			String[] strs = msg.split(",");
			if(strs != null && strs.length == 3) {
				
				String cmd = strs[0];
				String replyWriter = strs[1];
				String noticeTitle = strs[2];
				System.out.println("length ����?"+cmd);
				
				WebSocketSession replyWriterSession = userSessionsMap.get(replyWriter);
				WebSocketSession boardWriterSession = userSessionsMap.get("user@naver.com");
				System.out.println("replyWriterSession="+userSessionsMap.get(replyWriter));
				System.out.println("boardWriterSession"+boardWriterSession);
				
				Alarm alarm = new Alarm();
				
				//���
				if ("reply".equals(cmd) && boardWriterSession != null) {
					System.out.println("onmessage�ǳ�??");
					TextMessage tmpMsg = new TextMessage(replyWriter + "���� "
									+ noticeTitle+"��� ������ ���������� �÷Ƚ��ϴ�!");
					boardWriterSession.sendMessage(tmpMsg);
					alarm.setAlarmTarget("user@naver.com");
					alarm.setAlarmContent(tmpMsg.toString());
					alarmService.addAlarm(alarm);
				} else if ("reply".equals(cmd)){
					alarm.setAlarmTarget("user@naver.com");
					alarm.setAlarmContent(replyWriter + "���� "
							+ noticeTitle+"��� ������ ���������� �÷Ƚ��ϴ�!");
					alarmService.addAlarm(alarm);
				}
			}
			
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {//���� ����
		
		System.out.println("Socket ����");
		sessions.remove(session);
		userSessionsMap.remove(currentUserName(session),session);
	}

	
	private String currentUserName(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		User loginUser = (User)httpSession.get("user");
		
		if(loginUser == null) {
			String mid = session.getId();
			return mid;
		}
		String mid = loginUser.getUserId();
		return mid;
		
	}
}