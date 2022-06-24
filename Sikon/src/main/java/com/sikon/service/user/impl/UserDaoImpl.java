package com.sikon.service.user.impl;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.sikon.common.Search;
import com.sikon.service.domain.Career;
import com.sikon.service.domain.License;
import com.sikon.service.domain.User;
import com.sikon.service.user.UserDao;



@Repository("userDaoImpl")
public class UserDaoImpl implements UserDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public UserDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	
	// �Ϲ�ȸ������
	public void addUser(User user, Map map) throws Exception {
		sqlSession.insert("UserMapper.addUser", user);
		sqlSession.insert("UserMapper.addLicense", map.get("list"));
		sqlSession.insert("UserMapper.addCareer", map.get("list2"));
	}
	// īī�� ȸ������
	public void addKakaoUser(User user, Map map) throws Exception {
		sqlSession.insert("KakaoMapper.addKakaoUser", user);
		sqlSession.insert("UserMapper.addLicense", map.get("list"));
		sqlSession.insert("UserMapper.addCareer", map.get("list2"));
	}
	
	// id �ߺ�üũ
	public int checkId(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.checkId", userId);
	}
	// �г��� �ߺ�üũ
	public int checkNickname(String userNickname) throws Exception {
		return sqlSession.selectOne("UserMapper.checkNickname", userNickname);
	}
	
	// ȸ������ ��������
	public User getUser(String userId) throws Exception {
		return sqlSession.selectOne("UserMapper.getUser", userId);
	}
	// �ڰ������� ��������
	public List getLicense(String userId) throws Exception {
		return sqlSession.selectList("UserMapper.getLicense", userId);
	}
	// ��»������� ��������
	public List getCareer(String userId) throws Exception {
		return sqlSession.selectList("UserMapper.getCareer", userId);
	}
	
	// IDã��
	public String findUserId(String userName, String phone) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userName", userName);
		map.put("phone", phone);
		return sqlSession.selectOne("UserMapper.findUserId", map);
	}
	
	
	// ��ŷ���� ����
	public void changeUserRole(String userId, String role) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("role", role);
		
		sqlSession.update("UserMapper.changeUserRole", map);
	}
	
	// ��ŷ���� ����
	public void backUserRole(String userId, String mentorApply) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("mentorApply", mentorApply);
		
		sqlSession.update("UserMapper.backUserRole", map);
	}
	
	// ȸ����������
	public void updateUser(User user) throws Exception {
		sqlSession.update("UserMapper.updateUser", user);
	}	
	public void updateLicense(Map license, User user) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", license.get("list"));
		map.put("userId", user.getUserId());
		sqlSession.update("UserMapper.updateLicense", map);
	}
	public void updateCareer(Map career, User user) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", career.get("list2"));
		map.put("userId", user.getUserId());
		sqlSession.update("UserMapper.updateCareer", map);
	}

	// �н����� ����
	public int updateUserPw(String userId, String password)throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("password", password);
			
		return sqlSession.update("UserMapper.updateUserPw", map);	
	}	
		
	// ȸ����������Ʈ 
	public List<User> getUserList(Search search) throws Exception {
		return sqlSession.selectList("UserMapper.getUserList", search);
	}
	
	// ȸ��Ż��
	public void deleteUser(User user, Date quitDate, String quitStatus) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", user.getUserId());
		map.put("quitDate", quitDate);
		map.put("quitStatus", quitStatus);
		sqlSession.delete("UserMapper.deleteUser", map);
	}

	// �Խ��� Page ó��
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("UserMapper.getTotalCount", search);
	}
}