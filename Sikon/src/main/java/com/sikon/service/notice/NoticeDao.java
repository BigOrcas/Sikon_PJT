package com.sikon.service.notice;

import java.util.List;

import com.sikon.common.Search;
import com.sikon.service.domain.Coupon;
import com.sikon.service.domain.Notice;


public interface NoticeDao{
	
	//�������� ���
	public void insertNotice(Notice notice) throws Exception;
	
	//�������� ��ȸ
	public Notice findNotice(int noticeNo) throws Exception;
	
	//�������� ����Ʈ
	public List<Coupon> getNoticeList(Search search) throws Exception;
	
	//�������� ����
	public int getNoticeTotalCount(Search search) throws Exception;

	//�������� ����
	public void updateNotice(Notice notice) throws Exception;
		
	//�������� ����
	public void deleteNotice(int noticeNo) throws Exception;
}