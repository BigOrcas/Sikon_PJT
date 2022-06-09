package com.sikon.service.alarm;

import java.util.List;

import com.sikon.common.Search;
import com.sikon.service.domain.Alarm;


public interface AlarmDao{
	
	//�˸�����
	public void insertAlarm(Alarm alarm) throws Exception;

	//�˶�����Ʈ
	public List<Alarm> getAlarmList(Search search) throws Exception;
	
	// �Խ��� Page ó���� ���� ��üRow(totalCount)  return
	public int getTotalCount(Search search) throws Exception ;
	
}