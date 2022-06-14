package com.sikon.service.ranking;

import com.sikon.common.Search;

import java.util.List;
import java.util.Map;

public interface RankingService {
	
	//������ �� ��¥ ����
	public void addRecipeView(int recipeNo) throws Exception;
	
	// ������ ����Ʈ ��ȸ
	public Map<String, Object> getRecipeList(Search search) throws Exception;
	
	// ��ŷŬ���� ����Ʈ ��ȸ
	public Map<String, Object> getCookList(Search search) throws Exception;
			
}