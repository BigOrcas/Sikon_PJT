package com.sikon.service.user.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.sikon.common.Search;
import com.sikon.service.domain.License;
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
	
//	@Autowired
//	private JavaMailSender mailSender;
	
	///Constructor
	public UserServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	public void addUser(User user, Map map) throws Exception {
		System.out.println("map="+map);
		userDao.addUser(user, map);
	}
	public void addKakaoUser(User user) throws Exception {
		System.out.println("user="+user);
		userDao.addKakaoUser(user);
	}
//	public void addLicense(License license) throws Exception {
//		System.out.println("license="+license);
//		userDao.addLicense(license);
//	}
//	public void addCareer(Career career) throws Exception {
//		System.out.println("career="+career);
//		userDao.addCareer(career);
//	}
	
	public String getAccessToken (String authorize_code) throws Exception{
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);
            
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST ��û�� ���� �⺻���� false�� setDoOutput�� true��
            
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST ��û�� �ʿ�� �䱸�ϴ� �Ķ���� ��Ʈ���� ���� ����
            
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
            
			sb.append("&client_id=07cd433423b8401d52fda5136624e099"); //������ �߱޹��� key
			sb.append("&redirect_uri=http://localhost:8080/user/kakaoLogin"); // ������ ������ �ּ�
		//	sb.append("&redirect_uri=http://192.168.0.11:8080/user/kakaoLogin"); // ������ ������ �ּ�
			
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
            
			// ��� �ڵ尡 200�̶�� ����
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);
            
			// ��û�� ���� ���� JSONŸ���� Response �޼��� �о����
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
            
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
            
			// Gson ���̺귯���� ���Ե� Ŭ������ JSON�Ľ� ��ü ����
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
            
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);
            
			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}
	
	public HashMap<String, Object> getUserInfo(String access_Token) throws Exception{

		// ��û�ϴ� Ŭ���̾�Ʈ���� ���� ������ �ٸ� �� �ֱ⿡ HashMapŸ������ ����
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// ��û�� �ʿ��� Header�� ���Ե� ����
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

			String line = "";
			String result = "";
	//		String password = "";
			
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();

			System.out.println(email);
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
	//		userInfo.put("password", 1111);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		return userInfo;
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
	public List getLicense(String userId) throws Exception {
		return userDao.getLicense(userId);
	}
	public List getCareer(String userId) throws Exception {
		return userDao.getCareer(userId);
	}
	public List getUCL(String userId) throws Exception {
		return userDao.getUCL(userId);
	}
	
	public String findUserId(String userName, String phone) throws Exception {
		System.out.println("userName="+userName);
		 System.out.println("phone="+phone);
		String result = "";
		
		try {
			result = userDao.findUserId(userName, phone);
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("userName="+userName);
		 System.out.println("phone="+phone);
		
		return result;
	}
	
//	// Pwã�� ��ȿ�� �˻�
//	public int findUserPwCheck(User user)throws Exception {
//		return userDao.findUserPwCheck(user);
//	}
		
	// Pwã��
	public void updateUserPw(String userId,String password)throws Exception {
		
		userDao.updateUserPw(userId, password);
	}	
	// ��ŷ���� ����
	public void changeUserRole(String userId, String role) throws Exception {
		System.out.println("userId="+userId);
		System.out.println("role="+role);
		userDao.changeUserRole(userId, role);
	}
	// ��ŷ���� ����
	public void backUserRole(String userId, String mentorApply) throws Exception {
		System.out.println("userId="+userId);
		System.out.println("mentorApply="+mentorApply);
		userDao.backUserRole(userId, mentorApply);
		
	}

	public void updateUser(User user) throws Exception {
		System.out.println("user="+user);
	//	System.out.println("map="+map);
		
		userDao.updateUser(user);
	}
	public void updateLicense(Map license, User user) throws Exception {
		userDao.updateLicense(license, user);
	}
	public void updateCareer(Map career, User user) throws Exception {
		userDao.updateCareer(career, user);
	}
	public Map<String , Object > getUserList(Search search) throws Exception {
		List<User> list= userDao.getUserList(search);
		int totalCount = userDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	public void deleteUser(User dbUser, Date quitDate, String quitStatus) throws Exception {
		userDao.deleteUser(dbUser, quitDate, quitStatus);
	}

	public boolean checkDuplication(String userId) throws Exception {
		boolean result=true;
		User user=userDao.getUser(userId);
		if(user != null) {
			result=false;
		}
		return result;
	}
}