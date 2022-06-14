package com.sikon.service.point;

import com.sikon.service.domain.Point;

 
public interface PointService {
	
	
	public void addPoint(Point point) throws Exception;
	
	public Point getPoint(int pointNo) throws Exception ;
	
	public void updateHoldPoint(int totalpoint, String userId) throws Exception ;
	
}