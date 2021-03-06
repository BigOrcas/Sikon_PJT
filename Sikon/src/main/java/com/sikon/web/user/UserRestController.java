package com.sikon.web.user;

import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.sikon.common.Page;
import com.sikon.common.Search;
import com.sikon.service.domain.User;
import com.sikon.service.user.UserService;


@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	
		
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		return userService.getUser(userId);
	}
	
	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(	@RequestBody User user,
									HttpSession session ) throws Exception{
	
		System.out.println("/user/json/login : POST");
		
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		return dbUser;
	}
	
				
	@RequestMapping( value= "json/addUser", method=RequestMethod.POST )
	public User addUser( @RequestBody User user, Map map ) throws Exception {

		System.out.println("/user/json/addUser : POST");
		//Business Logic
		userService.addUser(user, map);
	
		return userService.getUser(user.getUserId());
	}
	
	@RequestMapping( value= "json/findUserId", method=RequestMethod.POST )
	@ResponseBody
	public String findUserId(@RequestParam("userName") String userName, @RequestParam("phone") String phone,
			Model model, HttpServletRequest request) throws Exception {
		
		System.out.println("/user/json/findUserId : POST");
					
		userService.findUserId(userName, phone);
		
		return userService.findUserId(userName, phone);
	}
	
	
	// id ????????
	@RequestMapping( value="json/checkId", method=RequestMethod.POST )
	public int checkId( @RequestParam("userId") String userId) throws Exception{
			int cnt = userService.checkId(userId);
			System.out.println("cnt"+cnt);
			return cnt;
	}
	
	// ?????? ????????
	@RequestMapping( value="json/checkNickname", method=RequestMethod.POST )
	public int checkNickname( @RequestParam("userNickname") String userNickname) throws Exception{
			int cnt = userService.checkNickname(userNickname);
			return cnt;
	}
	
	// ???????? ?????? ????
	@RequestMapping(value = "json/checkEmailPw", method = RequestMethod.GET)
	public String checkEmailPw(@RequestParam("userId") String userId) throws Exception{
		
		System.out.println("json/checkEmailPw: GET");
		
		int rendom = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
		
		String from = "se981106@gmail.com";//?????? ?? ????????
	    System.out.println("1 from="+from);
	    
	    String to = userId;
	    System.out.println("2 userId="+userId);
	    
	    String title = "?????????????? ?????? ???????? ??????.";
	    System.out.println("3 title="+title);
	    String content = "[????????] "+ rendom +" ??????. <br/> ???????? ???????? ??????????????.";
	    
//	    String title = "?????? ???? ???????? ?????? ???? ??????????????????.";
//	    System.out.println("3 title="+title);
//	    
//	    String content = "<h1>???????????? ????</h1>" +
//						"<br/>"+userId+"?? "+
//						"<br/>???????? ?????? ???? ???? ??????????????."+
//						"<br/>???????????? :   <h2>"+rendom+"</h2>"+
//						"<br/>?????? ?? ???????? ?????? ????????.";
	    System.out.println("4 content="+content);
	    
	    String num = "";
	    try {
	    	System.out.println("????");
	    	
	    	//JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
			MimeMessage mail = mailSender.createMimeMessage();
			System.out.println("???? ????");
			
	        MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8"); // true?? ???????? ???????? ???????????? ???
	        System.out.println("5 mailHelper="+mailHelper);
	        
	        mailHelper.setFrom(from); // ?????? ???? ?????????? ????, ???????? ??????????
	        mailHelper.setTo(to); // ???? ???? ??????
	        mailHelper.setSubject(title); // ????????
	        mailHelper.setText(content, true); // ????????   
	        System.out.println("6 from="+from);
	        System.out.println("7 to="+to);
	        System.out.println("8 title="+title);
	        System.out.println("9 content="+content);
	        
	        mailSender.send(mail);
	        System.out.println("10 mail="+mail);
	        num = Integer.toString(rendom);
	        System.out.println("11 num="+num);
	        
	    } catch(Exception e) {
	        num = "error";
	    }
	    
	    System.out.println("9 num="+num);
	    return num;
	}
	
	// ?????? ????
	@RequestMapping(value = "json/checkEmail", method = RequestMethod.GET)
	public String checkEmail(@RequestParam("userId") String userId) throws Exception{
		
		System.out.println("json/checkEmail: GET");
		
	    int serti = (int)((Math.random()* (99999 - 10000 + 1)) + 10000);
	    
	    String from = "se981106@gmail.com";//?????? ?? ????????
	    System.out.println("1 from="+from);
	    String to = userId;
	    System.out.println("2 userId="+userId);
	    String title = "?????????? ?????? ???????? ??????.";
	    System.out.println("3 title="+title);
	    String content = "[????????] "+ serti +" ??????. <br/> ???????? ???????? ??????????????.";
	    System.out.println("4 content="+content);
	    String num = "";
	    try {
	    	System.out.println("????");
	    	
	    	//JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
			MimeMessage mail = mailSender.createMimeMessage();
			System.out.println("???? ????");
	        MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8"); // true?? ???????? ???????? ???????????? ???
	        System.out.println("5 mailHelper="+mailHelper);
	        
	        mailHelper.setFrom(from); // ?????? ???? ?????????? ????, ???????? ??????????
	        mailHelper.setTo(to); // ???? ???? ??????
	        mailHelper.setSubject(title); // ????????
	        mailHelper.setText(content, true); // ????????   
	        System.out.println("6 from="+from);
	        System.out.println("7 to="+to);
	        System.out.println("8 title="+title);
	        System.out.println("9 content="+content);
	        
	        mailSender.send(mail);
	        System.out.println("10 mail="+mail);
	        num = Integer.toString(serti);
	        System.out.println("11 num="+num);
	        
	    } catch(Exception e) {
	        num = "error";
	    }
	    
	    System.out.println("9 num="+num);
	    return num;
	    
	}
	
	@RequestMapping( value="json/updateUser", method=RequestMethod.POST )
	public User updateUser( @RequestBody User user, Map license, Map career ) throws Exception{

		System.out.println("/user/json/updateUser : POST");
		
		//Business Logic
		userService.updateUser(user);
		
		return userService.getUser(user.getUserId());
	}
	
	@RequestMapping( value="json/listUser", method=RequestMethod.POST )
	public Map<String, Object> listUser( @RequestBody Search search ) throws Exception{

		System.out.println("/user/json/listUser : POST");
		
		//Business Logic
		System.out.println(search);
		search.setPageSize(pageSize);
		Map<String, Object> map = userService.getUserList(search);
		System.out.println(map.get("list"));
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, search.getPageSize());
		
		map.put("resultPage", resultPage);
		
		return map;
	}
	
	
	@RequestMapping( value="/json/changeUserRole" )
	public void changeUserRole( @RequestParam(value = "userId", required = false) String userId ,
						@RequestParam(value = "role", required = false) String role, Model model ) throws Exception{

		System.out.println("/user/changeUserRole : GET");
		System.out.println("/user/changeUserRole : GET"+userId);
		System.out.println("/user/changeUserRole : GET"+role);
		//Business Logic
		
		System.out.println("1 userId="+userId);
		System.out.println("1 mentorApply="+role);
		
		User user = userService.getUser(userId);
		
		
		
		role = user.setRole("mentor");
		
	//	user = userService.getUser(role);
	
		System.out.println("2 userId="+userId);
		System.out.println("2 mentorApply="+role);
		
		userService.changeUserRole(userId, role);
		

	}
	
	@RequestMapping( value="/json/backUserRole" )
	public void backUserRole(HttpServletRequest request, @RequestParam("userId") String userId,
											@RequestParam("mentorApply") String mentorApply) throws Exception {
		
		System.out.println("/user/backUserRole : POST");
		
		System.out.println("1 userId="+userId);
		System.out.println("1 mentorApply="+mentorApply);
		
		User user = userService.getUser(userId);
		
		
		
		mentorApply = user.setRole("N");
		
	//	user = userService.getUser(role);
	
		System.out.println("2 userId="+userId);
		System.out.println("2 mentorApply="+mentorApply);
		
		userService.backUserRole(userId, mentorApply);
		
	}
	
	
//	@RequestMapping( value="json/checkDuplication/{userId}", method=RequestMethod.GET )
//	public Map<String, Object> checkDuplication( @PathVariable String userId ) throws Exception{
//		
//		System.out.println("user/json/checkDuplication : POST");
//		//Business Logic
//		Map<String, Object> map = new HashMap();
//		boolean result=userService.checkDuplication(userId);
//		map.put(userId, new Boolean(result));
//
//		return map;
//	}

}