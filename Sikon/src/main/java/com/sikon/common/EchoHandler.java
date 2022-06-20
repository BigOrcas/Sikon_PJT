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
		
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
		
	//�α��� �� �ο� ��ü
	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1:1�� �� ���
	private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	
	///Method
	@Override
	public void afterConnectionEstablished(WebSocketSession socketSession) throws Exception { //Ŭ���̾�Ʈ�� ���� ����
		
		System.out.println("Socket ����");
		sessions.add(socketSession);
		System.out.println(currentUserName(socketSession)); //���� ������ ����
		String senderId = currentUserName(socketSession);
		userSessionsMap.put(senderId, socketSession);
	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession socketSession, TextMessage message) throws Exception { //push�˶� �޽��� ����
		
		System.out.println("session"+currentUserName(socketSession));
		String msg = message.getPayload(); //�ڹٽ�ũ��Ʈ���� �Ѿ�� �޽���
		System.out.println("msg="+msg);
		
		if (StringUtils.isNotEmpty(msg)) {
			
			String[] strs = msg.split(",");
			
			if(strs != null && strs.length == 4) {
				
				String cmd = strs[0];
				String fromUserId = strs[1];
				String fromUserNickname = strs[2];
				String toUserId = strs[3];
				
				WebSocketSession toUserSession = userSessionsMap.get(toUserId);
				System.out.println("fromUserSession="+userSessionsMap.get(fromUserId));
				System.out.println("toUserSession="+toUserSession);
				
				Alarm alarm = new Alarm();
								
				//��ŷ���� ���ã��
				if ("love".equals(cmd) && toUserSession != null) {
					
					TextMessage tmpMsg = new TextMessage(fromUserNickname + "���� ������� ���ã�⿡ �߰��߽��ϴ�!");
					toUserSession.sendMessage(tmpMsg);
					
					alarm.setAlarmTarget(toUserId);
					alarm.setAlarmContent(fromUserNickname + "���� ������� ���ã�⿡ �߰��߽��ϴ�!");
			
					alarmService.addAlarm(alarm);
				} else if ("love".equals(cmd)){
					alarm.setAlarmTarget(toUserId);
					alarm.setAlarmContent(fromUserNickname + "���� ������� ���ã�⿡ �߰��߽��ϴ�!");;
					alarmService.addAlarm(alarm);
				}
			}
			
			if(strs != null && strs.length == 5) {
				
				String cmd = strs[0];
				String fromUserId = strs[1];
				String fromUserNickname = strs[2];
				String toUserId = strs[3];
				String postName = strs[4];
				
				WebSocketSession toUserSession = userSessionsMap.get(toUserId);
				System.out.println("fromUserSession="+userSessionsMap.get(fromUserId));
				System.out.println("toUserSession="+toUserSession);
				
				Alarm alarm = new Alarm();
								
				//��ŷŬ���� ���ƿ�
				if ("heart".equals(cmd) && toUserSession != null) {
					
					TextMessage tmpMsg = new TextMessage(fromUserNickname + "���� ������� ��ŷŬ������ ���ƿ並 �������ϴ�! : [���� : '"
							+ postName+"']");
					toUserSession.sendMessage(tmpMsg);
					
					alarm.setAlarmTarget(toUserId);
					alarm.setAlarmContent(fromUserNickname + "���� ������� ��ŷŬ������ ���ƿ並 �������ϴ�! : [���� : '"
							+ postName+"']");
			
					alarmService.addAlarm(alarm);
				} else if ("heart".equals(cmd)){
					alarm.setAlarmTarget(toUserId);
					alarm.setAlarmContent(fromUserNickname + "���� ������� ��ŷŬ������ ���ƿ並 �������ϴ�! : [���� : '"
							+ postName+"']");
					alarmService.addAlarm(alarm);
				}
				
				//������ ����
				if ("recipeReview".equals(cmd) && toUserSession != null) {
					TextMessage tmpMsg = new TextMessage(fromUserNickname + "���� ȸ������ �����ǿ� ���並 �ۼ��߽��ϴ�! : [���� : '"
									+ postName+"']");
					toUserSession.sendMessage(tmpMsg);
					alarm.setAlarmTarget(toUserId);
					alarm.setAlarmContent(fromUserNickname + "���� ȸ������ �����ǿ� ���並 �ۼ��߽��ϴ�! : [���� : '"
							+ postName+"']");
					alarmService.addAlarm(alarm);
				} else if ("recipeReview".equals(cmd)){
					alarm.setAlarmTarget(toUserId);
					alarm.setAlarmContent(fromUserNickname + "���� ȸ������ �����ǿ� ���並 �ۼ��߽��ϴ�! : [���� : '"
							+ postName+"']");
					alarmService.addAlarm(alarm);
				}
			}
		}
	}
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession socketSession, CloseStatus status) throws Exception { //������ ���� ����
		
		System.out.println("Socket ����");
		sessions.remove(socketSession);
		userSessionsMap.remove(currentUserName(socketSession),socketSession);
	}

	
	private String currentUserName(WebSocketSession socketSession) { //���� ������ ���� ���̵�
		
		Map<String, Object> httpSession = socketSession.getAttributes();
		User loginUser = (User)httpSession.get("user");
		
		if(loginUser == null) {
			String mid = socketSession.getId();
			return mid;
		}
		
		String mid = loginUser.getUserId();
		return mid;
	}
	
}