package com.sikon.service.user;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Career;
import com.sikon.service.domain.License;
import com.sikon.service.domain.User;


 
public interface UserService {
	
	// �Ϲ�ȸ������
	public void addUser(User user, Map map) throws Exception;
	// īī�� ȸ������
	public void addKakaoUser(User user, Map map) throws Exception;
	
	// id �ߺ�üũ
	public int checkId(String userId) throws Exception;
	// �г��� �ߺ�üũ
	public int checkNickname(String userNickname) throws Exception;
	
	// īī�� �α����Ҷ� �޾ƿ��� ��ū�� īī�� ȸ������
	public String getAccessToken (String authorize_code) throws Exception;
	public HashMap<String, Object> getUserInfo(String access_Token) throws Exception;
	
	// īī�� �α����Ҷ� ȸ��ID �ߺ�üũ
	public boolean checkDuplication(String userId) throws Exception;
	
	// ȸ������ ��������
	public User getUser(String userId) throws Exception;
	// �ڰ������� ��������
	public List getLicense(String userId) throws Exception;
	// ��»������� ��������
	public List getCareer(String userId) throws Exception;
		
	// IDã��
	public String findUserId(String userName, String phone) throws Exception;
	
	// ��ŷ���� ����
	public void changeUserRole(String userId, String role) throws Exception;
	
	// ��ŷ���� ����
	public void backUserRole(String userId, String mentorApply) throws Exception;
		
	// ȸ����������
	public void updateUser(User user) throws Exception;
	public void updateLicense(Map license, User user) throws Exception;
	public void updateCareer(Map career, User user) throws Exception;
	
	// �н����� ����
	public void updateUserPw(String userId, String password) throws Exception;
		
	// ȸ����������Ʈ 
	public Map<String , Object> getUserList(Search search) throws Exception;
		
	// ȸ��Ż��
	public void deleteUser(User user, Date quitDate, String quitStatus) throws Exception;

}