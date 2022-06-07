package com.sikon.service.user;

import java.util.List;
import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.User;


//==> ȸ���������� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface UserService {
	
	// ȸ������
	public void addUser(User user, Map map) throws Exception;

	// ������Ȯ�� 
	public User getUser(String userId) throws Exception;
	public List getUCL(String userId) throws Exception;
	// IDã��
	public User findUserId(String userNickname) throws Exception ;
	
	// ȸ����������
	public void updateUser(User user) throws Exception;
	public void updateLicense(List license, String userId) throws Exception;
	public void updateCareer(List career, String userId) throws Exception;
	// ȸ����������Ʈ 
	public Map<String , Object> getUserList(Search search) throws Exception;
	
	// ȸ��Ż��
	public void deleteUser(User user) throws Exception ;
	
	// ȸ�� ID �ߺ� Ȯ��
//	public boolean checkDuplication(String userId) throws Exception;
	
	// id �ߺ�üũ
	public int checkId(String userId) throws Exception;

	

	

	
	
}