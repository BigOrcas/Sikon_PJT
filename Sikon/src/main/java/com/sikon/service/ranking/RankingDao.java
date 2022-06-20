package com.sikon.service.ranking;

import java.util.List;

import com.sikon.common.Search;
import com.sikon.service.domain.Love;
import com.sikon.service.domain.Product;
import com.sikon.service.domain.Recipe;


public interface RankingDao{
	
	//������ �� ��¥ ����
	public void insertRecipeView(int recipeNo) throws Exception;
	
	// SELECT LIST
	public List<Recipe> getRecipeList(Search search) throws Exception;
	
	//���� ��¥ ����
	public void insertPurchase(int prodNo, String serialNo) throws Exception;
	
	//���� ��¥ ����
	public void deletePurchase(int prodNo, String serialNo) throws Exception;
	
	//�Ǹ� ��ŷ ����Ʈ
	public List<Product> getProductList(Search search) throws Exception;
	
	//���ã�� ���� ��¥ ����
	public void insertLoveMentor(String userNickname, String userId) throws Exception;
	
	//���ã�� ���� ��¥ ����
	public void deleteLoveMentor(String userNickname, String userId) throws Exception;
	
	// SELECT LIST
	public List<Love> getLoveList(Search search) throws Exception;
		
}