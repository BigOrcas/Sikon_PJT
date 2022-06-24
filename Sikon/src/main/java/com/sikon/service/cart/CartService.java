package com.sikon.service.cart;

import java.util.List;



import com.sikon.service.domain.Cart;

 
public interface CartService {
	
	//��ٱ��� �߰�
	public void addCart(Cart cart) throws Exception;
	
	//��ٱ��� ����Ʈ
	public List<Cart> getCartList(String userId) throws Exception;
	
	//��ٱ��� ���� ������Ʈ
	public void updateCart(Cart cart) throws Exception;
	
	//��ٱ��Ͽ��� ���Ž� ����
	public void deleteCart(int cartNo) throws Exception;
		
	//�ش� ��ٱ��� ��������
	public Cart getCart(int cartNo) throws Exception ;
	
}