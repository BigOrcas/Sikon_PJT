package com.sikon.service.ranking;

import java.util.List;

import com.sikon.common.Search;
import com.sikon.service.domain.Love;
import com.sikon.service.domain.Product;
import com.sikon.service.domain.Recipe;


public interface RankingDao{
	
	//������ ��ȸ��¥ ���
	public void insertRecipeView(int recipeNo) throws Exception;
	
	//������ ��ŷ ��ȸ
	public List<Recipe> getRecipeList(Search search) throws Exception;
	
	//����� ���ų�¥ ���
	public void insertPurchase(int prodNo, String serialNo) throws Exception;
	
	//����� ���ų�¥ ����
	public void deletePurchase(int prodNo, String serialNo) throws Exception;
	
	//����� ��ŷ ��ȸ
	public List<Product> getProductList(Search search) throws Exception;
	
	//��ŷ���� ���ã�� ��¥ ���
	public void insertLoveMentor(String userNickname, String userId) throws Exception;
	
	//��ŷ���� ���ã�� ��¥ ����
	public void deleteLoveMentor(String userNickname, String userId) throws Exception;
	
	//��ŷ���� ��ŷ ����Ʈ
	public List<Love> getLoveList(Search search) throws Exception;
		
}