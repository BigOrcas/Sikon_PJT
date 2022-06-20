package com.sikon.service.coupon;

import java.util.List;

import com.sikon.common.Search;
import com.sikon.service.domain.Coupon;


public interface CouponDao{
	
	//��������
	public void insertCoupon(Coupon coupon) throws Exception;

	//�����߱�
	public void issueCoupon(Coupon coupon) throws Exception;
	
	//���� ����Ʈ
	public List<Coupon> getCouponList(Search search) throws Exception;
	
	//���� ����
	public int getTotalCount(Search search) throws Exception ;
	
	//�����˻�
	public List<Coupon> findCoupon() throws Exception;
	
	//�߱����� ����Ʈ
	public List<Coupon> getIssuedCouponList(Search search) throws Exception ;
		
	//�߱����� ����
	public int getIssuedTotalCount(Search search) throws Exception ;
	
	//�߱����� �˻�
	public Coupon findIssuedCoupon(int issueNo) throws Exception;
	
	//�������� ����Ʈ
	public List<Coupon> getMyCouponList(Search search, String userId) throws Exception ;
		
	//�������� ����
	public int getMyCouponCount(String userId) throws Exception;
	
	//�������� �˻�
	public List<Coupon> findMyCoupon(String userId) throws Exception;
				
	//�߱����� ���º���
	public void updateIssueStatus(Coupon coupon) throws Exception;
	
	//��������
	public void deleteCoupon(int couponNo) throws Exception;
}