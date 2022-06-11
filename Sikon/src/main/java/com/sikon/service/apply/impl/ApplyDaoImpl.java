package com.sikon.service.apply.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.sikon.common.Search;
import com.sikon.service.domain.Apply;
import com.sikon.service.domain.Heart;
import com.sikon.service.domain.Purchase;
import com.sikon.service.domain.Wish;
import com.sikon.service.apply.ApplyDao;


//==> ȸ������ Dao CRUD ����
@Repository("applyDaoImpl")
public class ApplyDaoImpl implements ApplyDao{
	
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public ApplyDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addApply(Apply apply) throws Exception {
		sqlSession.insert("ApplyMapper.addApply", apply);
	}

	public List<Apply> getApplyList(Search search,String applierId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("applierId", applierId);
		map.put("search", search);
		System.out.println("search: "+map.get("search"));
		System.out.println("impl: "+search.getApplyCondition());
		return sqlSession.selectList("ApplyMapper.getApplyList", map);
	}

	public List<Apply> getSaleList(Search search) throws Exception {
		
		return sqlSession.selectList("ApplyMapper.getSaleList", search);
	}

	// �Խ��� Page ó���� ���� ��ü Row(totalCount)  return
	public int getTotalCount2(Search search) throws Exception {		
		
		return sqlSession.selectOne("ApplyMapper.getTotalCount2", search);
	}	

	public Apply getApply(int applyNo) throws Exception {
		return sqlSession.selectOne("ApplyMapper.getApply", applyNo);
	}

	
	public void updateApplyStatus(Apply apply) throws Exception{
		sqlSession.update("ApplyMapper.updateApplyStatus",apply);
	}
//
	// �Խ��� Page ó���� ���� ��ü Row(totalCount)  return
	public int getTotalCount(Search search,String applierId) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("applierId", applierId);
		map.put("search", search);
		return sqlSession.selectOne("ApplyMapper.getTotalCount", map);
	}

	public void buyCook (int cookStatus, int cookNo) throws Exception {
		
		String cookStatusNumber = cookStatus+"";
		String cookNumber = cookNo+"";
		
	
		Map<String, String> map = new HashMap<String, String>();
		map.put("cookStatus", cookStatusNumber);
		map.put("cookNo",  cookNumber );
		
		sqlSession.update("ApplyMapper.buyCook",map);
		
	}
	public void cancel (int cookStatus, int cookNo) throws Exception {
		
		String cookStatusNumber = cookStatus+"";
		String cookNumber = cookNo+"";
		Map<String, String> map = new HashMap<String, String>();
		map.put("cookStatus", cookStatusNumber);
		map.put("cookNo",  cookNumber );
		
		sqlSession.update("ApplyMapper.cancel",map);
		
	}

	

}