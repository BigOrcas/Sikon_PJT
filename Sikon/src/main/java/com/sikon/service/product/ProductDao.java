package com.sikon.service.product;

import java.util.List;

import com.sikon.common.Search;
import com.sikon.service.domain.Product;


public interface ProductDao {
	
	//��ǰ���
	public void addProduct(Product product) throws Exception ;

	//��ǰ ���� ��������
	public Product getProduct(int prodNo) throws Exception ;
	
	//��ǰ ���� ����
	public void updateProduct(Product product) throws Exception ;

	//��ǰ ��� ��������
	public List<Product> getProductList(Search search) throws Exception ;
	
	//��ǰ�� ��� �� ��������
	public int getTotalCount(Search search) throws Exception ;
	
	//��ǰ�� ��� ��������
	public List<Product> getProdNames(Search search) throws Exception ;
	
	
	
}