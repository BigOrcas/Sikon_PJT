package com.sikon.service.ranking;

import com.sikon.common.Search;

import java.util.Map;

public interface RankingService {
	
	//������ ��ȸ��¥ ���
	public void addRecipeView(int recipeNo) throws Exception;
	
	//������ ��ŷ ����Ʈ
	public Map<String, Object> getRecipeList(Search search) throws Exception;
	
	//����� ���ų�¥ ����
	public void addPurchase(int prodNo, String serialNo) throws Exception;
	
	//����� ���ų�¥ ����
	public void deletePurchase(int prodNo, String serialNo) throws Exception;
	
	//����� ��ŷ ����Ʈ
	public Map<String, Object> getProductList(Search search) throws Exception;
	
	//��ŷ���� ���ã�� ��¥ ����
	public void addLoveMentor(String userNickname, String userId) throws Exception;
	
	//��ŷ���� ���ã�� ��¥ ����
	public void deleteLoveMentor(String userNickname, String userId) throws Exception;
	
	//��ŷ���� ��ŷ ����Ʈ
	public Map<String, Object> getLoveList(Search search) throws Exception;
			
}