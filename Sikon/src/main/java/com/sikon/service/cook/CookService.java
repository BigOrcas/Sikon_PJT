package com.sikon.service.cook;

import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Cook;


public interface CookService {

	public void addCook(Cook cook) throws Exception;

	public Map<String, Object> getCookList(Search search) throws Exception;

	public Cook getCook(int cookNo) throws Exception;

	public void updateCook(Cook cook) throws Exception;

	public void deleteCook(int cookNo) throws Exception;
	
	public Map<String, Object> listMyCook(Search search,String userNickname) throws Exception;



}
