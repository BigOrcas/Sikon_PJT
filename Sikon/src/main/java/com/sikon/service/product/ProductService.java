package com.sikon.service.product;


import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Product;


public interface ProductService {
	
	//��ǰ���
	public void addProduct(Product product) throws Exception;
	
	//��ǰ ���� ��������
	public Product getProduct(int prodNo) throws Exception;
	
	//��ǰ ���� ����
	public void updateProduct(Product product) throws Exception;

	//��ǰ ��� ��������
	public Map<String , Object> getProductList(Search search) throws Exception;
	
	//��ǰ�� ��� ��������
	public Map<String , Object> getProdNames(Search search) throws Exception;


}