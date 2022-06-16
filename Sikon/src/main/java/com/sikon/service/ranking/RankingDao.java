package com.sikon.service.ranking;

import java.util.List;

import com.sikon.common.Search;
import com.sikon.service.domain.Recipe;
import com.sikon.service.domain.User;


public interface RankingDao{
	
	//������ �� ��¥ ����
	public void insertRecipeView(int recipeNo) throws Exception;
	
	// SELECT LIST
	public List<Recipe> getRecipeList(Search search) throws Exception;
	
	//���ã�� ���� ��¥ ����
	public void insertLoveMentor(User user) throws Exception;
	
	//���ã�� ���� ��¥ ����
	public void deleteLoveMentor(User user) throws Exception;
		
}