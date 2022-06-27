package com.sikon.web.love;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sikon.service.domain.Love;
import com.sikon.service.love.LoveService;
import com.sikon.service.ranking.RankingService;


@RestController
@RequestMapping("/love/*")
public class LoveRestController {
	
	/// Field
	@Autowired
	@Qualifier("loveServiceImpl")
	private LoveService loveService;
	
	@Autowired
	@Qualifier("rankingServiceImpl")
	private RankingService rankingService;
	
	public LoveRestController() {
		System.out.println(this.getClass());
	}	

	
	@RequestMapping( value="json/updateLove", method=RequestMethod.POST )
	public int updateHeart(@ModelAttribute("love") Love love, @RequestParam("userNickname") String userNickname, 
			@RequestParam("userId") String userId, HttpServletRequest request ) throws Exception {


		
		int loveCheck = loveService.loveCheck(userNickname, userId);

		
		
		if(loveCheck == 0) {
			//���ƿ� ó������
			loveService.addLove(userNickname,userId); //heart���̺� ����			
			loveService.loveCheck(userNickname, userId);//���ƿ� check 1
			rankingService.addLoveMentor(userNickname, userId);
	

			
		} else{
			loveService.deleteLove(userNickname,userId); //���ƿ� ����
			loveService.loveCheck(userNickname, userId);//���ƿ� check 1
			rankingService.deleteLoveMentor(userNickname, userId);
				

		}
			return loveCheck;
	}
	
}
