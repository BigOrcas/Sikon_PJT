package com.sikon.web.notice;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sikon.service.notice.NoticeService;
import com.sikon.service.user.UserService;


//==> ���� Controller
@Controller
@RequestMapping("/notice/*")
public class NoticeRestController {
	
	///Field
	@Autowired
	@Qualifier("noticeServiceImpl")
	private NoticeService noticeService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userSerivce;
		
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ���� �Ұ�
	//==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	@Value("#{commonProperties['summerNote']}")
	String summerNote;
	
	
	///Constructor
	public NoticeRestController(){
		System.out.println(this.getClass());
	}
	
	
	///Method
	@PostMapping(value="/json/uploadSummernoteImageFile", produces = "application/json")
	@ResponseBody
	public Map uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
		
		Map map = new HashMap();
		
		String fileRoot = summerNote;	//����� �ܺ� ���� ���
		System.out.println(fileRoot);
		String originalFileName = multipartFile.getOriginalFilename();	//�������� ���ϸ�
		
		System.out.println(originalFileName);
		
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//���� Ȯ����
				
		String savedFileName = UUID.randomUUID() + extension;	//����� ���� ��
		
		System.out.println(savedFileName);
		
		File targetFile = new File(fileRoot + savedFileName);
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); //���� ����
			map.put("url", "/summernoteImage/"+savedFileName);
			map.put("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//����� ���� ����
			map.put("responseCode", "error");
			e.printStackTrace();
		}
		
		return map;
	}
	
	
	@RequestMapping(value="/json/pushAlarm", method=RequestMethod.POST)
	@ResponseBody
	public Map pushAlram(@RequestParam("pushData") String pushData) {
		
		Map map = new HashMap();
		
		System.out.println(pushData);
				
		map.put("userId", "admin@naver.com");
		map.put("noticeTitle", pushData);
		map.put("responseCode", "success");
				
		return map;
	}

	
}