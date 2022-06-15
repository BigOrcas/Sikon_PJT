package com.sikon.service.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.License;
import com.sikon.service.domain.User;


//==> ȸ���������� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface UserService {
	
	// ȸ������
	public void addUser(User user, Map map) throws Exception;
	public void addKakaoUser(User user) throws Exception;
//	public void addLicense(License license) throws Exception;
//	public void addCareer(Career career) throws Exception;
	
	// īī�� �α���
	public String getAccessToken (String authorize_code) throws Exception;
	public HashMap<String, Object> getUserInfo(String access_Token) throws Exception;
	
	// ������Ȯ�� 
	public User getUser(String userId) throws Exception;
	public List getLicense(String userId) throws Exception;
	public List getCareer(String userId) throws Exception;
	
	public List getUCL(String userId) throws Exception;
	// IDã��
	public String findUserId(String userName, String phone) throws Exception ;
	
	// ȸ����������
	public void updateUser(User user) throws Exception;
	public void updateLicense(Map license, User user) throws Exception;
	public void updateCareer(Map career, User user) throws Exception;
	// ȸ����������Ʈ 
	public Map<String , Object> getUserList(Search search) throws Exception;
	
	// ȸ��Ż��
	public void deleteUser(User user) throws Exception ;
	
	// ȸ�� ID �ߺ� Ȯ��
	public boolean checkDuplication(String userId) throws Exception;
	
	// id �ߺ�üũ
	public int checkId(String userId) throws Exception;
	// �г��� �ߺ�üũ
	public int checkNickname(String userNickname) throws Exception;

	

	

	
	
}