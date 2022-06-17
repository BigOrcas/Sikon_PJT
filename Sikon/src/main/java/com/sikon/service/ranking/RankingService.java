package com.sikon.service.ranking;

import com.sikon.common.Search;

import java.util.Map;

public interface RankingService {
	
	//������ �� ��¥ ����
	public void addRecipeView(int recipeNo) throws Exception;
	
	// ������ ����Ʈ ��ȸ
	public Map<String, Object> getRecipeList(Search search) throws Exception;
	
	//���� ��¥ ����
	public void addPurchase(int prodNo) throws Exception;
	
	//���ã�� ���� ��¥ ����
	public void addLoveMentor(String userNickname, String userId) throws Exception;
	
	//���ã�� ���� ��¥ ����
	public void deleteLoveMentor(String userNickname, String userId) throws Exception;
	
	// ���ã�� ����Ʈ ��ȸ
	public Map<String, Object> getLoveList(Search search) throws Exception;
			
}