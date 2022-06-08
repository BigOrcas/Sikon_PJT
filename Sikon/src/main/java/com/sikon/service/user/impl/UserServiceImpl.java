package com.sikon.service.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sikon.common.Search;
import com.sikon.service.domain.User;
import com.sikon.service.user.UserDao;
import com.sikon.service.user.UserService;;


//==> ȸ������ ���� ����
@Service("userServiceImpl")
public class UserServiceImpl implements UserService{
	
	///Field
	@Autowired
	@Qualifier("userDaoImpl")
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addUser(User user, Map map) throws Exception {
		System.out.println("map="+map);
		userDao.addUser(user, map);
	}
	
	// id �ߺ�üũ
	public int checkId(String userId) throws Exception {
		int cnt = userDao.checkId(userId);
		System.out.println("cnt: " + cnt);
		return cnt;
	}
	// id �ߺ�üũ
	public int checkNickname(String userNickname) throws Exception {
		int cnt = userDao.checkNickname(userNickname);
		System.out.println("cnt: " + cnt);
		return cnt;
	}

	public User getUser(String userId) throws Exception {
		return userDao.getUser(userId);
	}
	public List getUCL(String userId) throws Exception {
		return userDao.getUCL(userId);
	}
	
	public User findUserId(String userNickname) throws Exception {
		return userDao.findUserId(userNickname);
	}

	public void updateUser(User user) throws Exception {
		System.out.println("user="+user);
	//	System.out.println("map="+map);
		
		userDao.updateUser(user);
	}
	public void updateLicense(List license, String userId) throws Exception {
		userDao.updateLicense(license, userId);
	}
	public void updateCareer(List career, String userId) throws Exception {
		userDao.updateCareer(career, userId);
	}
	public Map<String , Object > getUserList(Search search) throws Exception {
		List<User> list= userDao.getUserList(search);
		int totalCount = userDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	public void deleteUser(User user) throws Exception {
		userDao.deleteUser(user);
	}

//	public boolean checkDuplication(String userId) throws Exception {
//		boolean result=true;
//		User user=userDao.getUser(userId);
//		if(user != null) {
//			result=false;
//		}
//		return result;
//	}
}