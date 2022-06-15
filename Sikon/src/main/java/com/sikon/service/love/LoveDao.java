package com.sikon.service.love;

import java.util.List;

import com.sikon.common.Search;
import com.sikon.service.domain.Love;

//å���ǿ��� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
public interface LoveDao {

	// INSERT
	public void addLove(Love Love) throws Exception;
	
	//SELECT LIST
//	public List<Love> getLoveList(Search search,String userId) throws Exception;
	public List getLoveList(Search search,String userId) throws Exception;

	//DELETE
	public void deleteLove(int LoveNo) throws Exception;

	//SELECT ROW Count
	public int getTotalCount(Search search,String userId) throws Exception ;
	
}