package com.sikon.service.point;

import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Point;

 
public interface PointService {
	
	// ����Ʈ �߰�
	public void addPoint(Point point) throws Exception;
	
	// ����Ʈ ��������
	public Point getPoint(int pointNo) throws Exception ;
	
	//����Ʈ ����
	public void updateHoldPoint(int totalpoint, String userId) throws Exception ;
	
	//����Ʈ ��� ��������
	public Map<String, Object> getPointList(Search search, String userId) throws Exception;
	
}