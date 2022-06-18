package com.sikon.service.alarm;

import com.sikon.common.Search;
import com.sikon.service.domain.Alarm;

import java.util.Map;

import javax.servlet.http.HttpSession;

public interface AlarmService {
	
	//�˶�����
	public void addAlarm(Alarm Alarm, HttpSession session) throws Exception;
	
	//�˶�����
	public int getAlarmCount(String userId) throws Exception;
	
	//�˶�List
	public Map<String , Object> getAlarmList(Search search, String userId) throws Exception;

	public void updateAlarmStatus(Alarm alarm) throws Exception;
	
	//��Ȯ�� �˶� ����
	public int getStatusCount(String userId) throws Exception;
		
}