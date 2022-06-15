package com.sikon.service.love;

import java.util.List;
import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Love;

//å���ǿ��� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface LoveService {

	//å���� ���
	public void addLove(Love Love) throws Exception;

	//å���� ����Ʈ ��ȸ
	public Map<String, Object> getLoveList(Search search,String userId) throws Exception;

	//å���� ����
	public void deleteLove(int LoveNo) throws Exception;

}
