package com.sikon.service.bookmark;

import java.util.List;
import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Bookmark;

//å���ǿ��� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface BookmarkService {

	//å���� ���
	public void addBookmark(int recipeNo, String userId) throws Exception;

	//å���� ����Ʈ ��ȸ
	public Map<String, Object> getBookmarkList(Search search,String userId) throws Exception;

	//å���� ����
	public void deleteBookmark(int recipeNo, String userId) throws Exception;

	//å���� �ߺ�üũ
	public int checkDuplicate(int recipeNo,String userId) throws Exception;

}
