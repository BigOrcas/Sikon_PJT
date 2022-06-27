package com.sikon.service.bookmark.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.sikon.common.Search;
import com.sikon.service.bookmark.BookmarkDao;
import com.sikon.service.domain.Bookmark;

//å���� DAO CRUD ����
@Repository("bookmarkDaoImpl")
public class BookmarkDaoImpl implements BookmarkDao {

	/// Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	/// Constructor
	public BookmarkDaoImpl() {
		System.out.println(this.getClass());
	}

	/// Method
	public void addBookmark(int recipeNo, String userId) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("recipeNo", recipeNo);
		map.put("userId", userId);

		sqlSession.insert("BookmarkMapper.addBookmark", map);
	}

	public List getBookmarkList(Search search, String userId) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userId", userId);

		List list = sqlSession.selectList("BookmarkMapper.getBookmarkList", map);

		return list;
	}

	public void deleteBookmark(int recipeNo, String userId) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("recipeNo", recipeNo);
		map.put("userId", userId);

		sqlSession.delete("BookmarkMapper.deleteBookmark", map);
	}

	public int getTotalCount(Search search, String userId) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("userId", userId);

		return sqlSession.selectOne("BookmarkMapper.getTotalCount", map);

	}

	public int checkDuplicate(int recipeNo, String userId) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("recipeNo", recipeNo);
		map.put("userId", userId);

		return sqlSession.selectOne("BookmarkMapper.checkDuplicate", map);
	}

}