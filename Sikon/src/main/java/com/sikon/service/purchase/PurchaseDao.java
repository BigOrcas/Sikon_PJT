package com.sikon.service.purchase;

import java.util.List;

import com.sikon.common.Search;
import com.sikon.service.domain.Purchase;


public interface PurchaseDao {
	
	//��ǰ ����
	public void addPurchase(Purchase purchase) throws Exception ;

	//��ǰ ���ų��� ��������
	public Purchase getPurchase(int tranNo) throws Exception ;

	//��ǰ �ϰ����� ���� �������� 
	public List<Purchase> getPurchaseBySerial(String serialNo) throws Exception ;

	//��ǰ ���Ÿ�� ��������
	public List<Purchase> getPurchaseList(Search search, String buyerId) throws Exception ;
	
	//��ǰ �ǸŸ�� ��������
	public List<Purchase> getSalesList(Search search) throws Exception ;

	//��ǰ ���ų��� �����ϱ�
	public void updatePurchase(Purchase purchase) throws Exception ;
	
	//��ǰ ��ۻ��� �����ϱ�
	public void updateDivyStatus(Purchase purchase) throws Exception ;
	
	//��ǰ ���Ž� ��� �����ϱ�
	public void updateStock(int purchaseQuantity, int prodNo) throws Exception ;
	
	//��ǰ ������ҽ� ��� �����ϱ�
	public void cancelOrder(int purchaseQuantity, int prodNo) throws Exception ;
	
	//��ǰ ���Ÿ�ϼ� ��������
	public int getTotalCount(Search search, String buyerId) throws Exception ;

	//��ǰ �ǸŸ�ϼ� ��������
	public int getTotalCount2(Search search) throws Exception ;
	
}