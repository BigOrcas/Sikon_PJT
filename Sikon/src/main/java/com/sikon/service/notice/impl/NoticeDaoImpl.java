package com.sikon.service.notice.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.sikon.common.Search;
import com.sikon.service.domain.Coupon;
import com.sikon.service.domain.Notice;
import com.sikon.service.notice.NoticeDao;



@Repository("noticeDaoImpl")
public class NoticeDaoImpl implements NoticeDao {

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	///Constructor
	public NoticeDaoImpl() {
		System.out.println(this.getClass());
	}

	
	/// Method
	//�������� ���
	public void insertNotice(Notice notice) throws Exception {
		
		sqlSession.insert("NoticeMapper.addNotice", notice);
	}
	
	//�������� ��ȸ
	public Notice findNotice(int noticeNo) throws Exception {
		
		return sqlSession.selectOne("NoticeMapper.findNotice", noticeNo);
	}
	
	//�������� ����Ʈ
	public List<Coupon> getNoticeList(Search search) throws Exception {
		
		return sqlSession.selectList("NoticeMapper.getNoticeList", search);
	}
	
	//�������� ����
	public int getNoticeTotalCount(Search search) throws Exception {
		
		return sqlSession.selectOne("NoticeMapper.getTotalCount", search);
	}
	
	//�������� ����
	public void updateNotice(Notice notice) throws Exception {
		
		sqlSession.update("NoticeMapper.updateNotice", notice);
	}
	
	//�������� ����
	public void deleteNotice(int noticeNo) throws Exception{
		
		sqlSession.delete("NoticeMapper.deleteNotice", noticeNo);
	}

}