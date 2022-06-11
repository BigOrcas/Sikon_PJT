package com.sikon.service.user;

import java.util.List;
import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.License;
import com.sikon.service.domain.User;


//==> ȸ���������� CRUD �߻�ȭ/ĸ��ȭ�� DAO Interface Definition
public interface UserDao {
	
	// INSERT
	public void addUser(User user, Map map) throws Exception;
	public void addKakaoUser(User user) throws Exception;
//	public void addLicense(License license) throws Exception;
//	public void addCareer(Career career) throws Exception;
	
	// id �ߺ�üũ
	public int checkId(String userId) throws Exception;
	// �г��� �ߺ�üũ
	public int checkNickname(String userNickname) throws Exception;

	// SELECT ONE
	public User getUser(String userId) throws Exception ;
	public List getLicense(String userId) throws Exception;
	public List getCareer(String userId) throws Exception;
	
	public List getUCL(String userId) throws Exception;
	// IDã��
	public User findUserId(String userNickname) throws Exception ;

	// ȸ����������
	public void updateUser(User user) throws Exception ;
	public void updateLicense(Map license, User userId) throws Exception ;
	public void updateCareer(Map career, User userId) throws Exception;
	// ȸ�����
	public List<User> getUserList(Search search) throws Exception ;
	
	// ȸ��Ż��
	public void deleteUser(User user) throws Exception ;
		
	// �Խ��� Page ó���� ���� ��üRow(totalCount)  return
	public int getTotalCount(Search search) throws Exception ;

	

	




	
	
}