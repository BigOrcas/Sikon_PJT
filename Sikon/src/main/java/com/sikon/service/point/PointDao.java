package com.sikon.service.point;

import java.util.List;

import com.sikon.common.Search;
import com.sikon.service.domain.Point;


public interface PointDao {
	
	// ����Ʈ �߰�
	public void addPoint(Point point) throws Exception ;
	
	// ����Ʈ ��������
	public Point getPoint(int pointNo) throws Exception ;
	
	//����Ʈ ����
	public void updateHoldPoint(int totalpoint, String userId) throws Exception ;
	
	//����Ʈ ��� ��������
	public List getPointList(Search search, String userId) throws Exception;
	
	//����Ʈ ��� ��
	public int pointTotalCount(Search search, String userId) throws Exception;

	
}