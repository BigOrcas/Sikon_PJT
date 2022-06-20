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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sikon.service.notice.NoticeService;
import com.sikon.service.user.UserService;


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
		
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
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
	public Map uploadSummernoteImageFile( @RequestParam("file") MultipartFile multipartFile ) {
		
		Map map = new HashMap();
		
		String fileRoot = summerNote; //����� �ܺ� ���� ���
		String originalFileName = multipartFile.getOriginalFilename(); //�������� ���ϸ�
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); //���� Ȯ����
		String savedFileName = UUID.randomUUID() + extension; //����� ���� ��
		
		File targetFile = new File(fileRoot + savedFileName);
		
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); //���� ����
			map.put("url", "/summernoteImage/"+savedFileName);
			map.put("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); //����� ���� ����
			map.put("responseCode", "error");
			e.printStackTrace();
		}
		
		return map;
	}
	
}