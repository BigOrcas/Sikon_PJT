package com.sikon.service.ranking.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sikon.common.Search;
import com.sikon.service.domain.Love;
import com.sikon.service.domain.Product;
import com.sikon.service.domain.Recipe;
import com.sikon.service.ranking.RankingDao;
import com.sikon.service.ranking.RankingService;


@Service("rankingServiceImpl")
public class RankingServiceImpl implements RankingService{
	
	///Field
	@Autowired
	@Qualifier("rankingDaoImpl")
	private RankingDao rankingDao;

	
	/// Constructor
	public RankingServiceImpl() {
		System.out.println(this.getClass());
	}


	///Method
	//������ �� ��¥ ����
	public void addRecipeView(int recipeNo) throws Exception {
		rankingDao.insertRecipeView(recipeNo);
	}
	
	//������ ����Ʈ ��ȸ
	public Map<String, Object> getRecipeList(Search search) throws Exception {
		System.out.println("search=" + search);
		List<Recipe> list = rankingDao.getRecipeList(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		System.out.println("list=" + list);

		return map;
	}
	
	//���� ��¥ ����
	public void addPurchase(int prodNo, String serialNo) throws Exception {
		rankingDao.insertPurchase(prodNo, serialNo);
	}
	
	//���� ��¥ ����
	public void deletePurchase(int prodNo, int tranNo) throws Exception{
		rankingDao.deletePurchase(prodNo, tranNo);
	}
	
	// �Ǹ� ��ŷ ��ȸ
	public Map<String, Object> getProductList(Search search) throws Exception {
		System.out.println("search=" + search);
		List<Product> list = rankingDao.getProductList(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		System.out.println("list=" + list);

		return map;
	}
	
	//���ã�� ���� ��¥ ����
	public void addLoveMentor(String userNickname, String userId) throws Exception{
		rankingDao.insertLoveMentor(userNickname, userId);
	}
	
	//���ã�� ���� ��¥ ����
	public void deleteLoveMentor(String userNickname, String userId) throws Exception{
		rankingDao.deleteLoveMentor(userNickname, userId);
	}
	
	// ���ã�� ����Ʈ ��ȸ
	public Map<String, Object> getLoveList(Search search) throws Exception {
		System.out.println("search=" + search);
		List<Love> list = rankingDao.getLoveList(search);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		System.out.println("list=" + list);

		return map;
	}
	
}