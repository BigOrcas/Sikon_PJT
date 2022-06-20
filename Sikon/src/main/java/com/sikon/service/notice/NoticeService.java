package com.sikon.service.notice;

import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Notice;

public interface NoticeService {
	
	//�������� ���
	public void addNotice(Notice notice) throws Exception;
	
	//�������� ��ȸ
	public Notice getNotice(int noticeNo) throws Exception;
	
	//�������� ����Ʈ
	public Map<String , Object > getNoticeList(Search search) throws Exception;
	
	//�������� ����
	public void updateNotice(Notice notice) throws Exception;
		
	//�������� ����
	public void deleteNotice(int noticeNo) throws Exception;;
	
}