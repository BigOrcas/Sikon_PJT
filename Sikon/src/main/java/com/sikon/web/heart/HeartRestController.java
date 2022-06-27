package com.sikon.web.heart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sikon.service.domain.Heart;
import com.sikon.service.heart.HeartService;


@RestController
@RequestMapping("/heart/*")
public class HeartRestController {
	
	/// Field
	@Autowired
	@Qualifier("heartServiceImpl")
	private HeartService heartService;

	public HeartRestController() {
		System.out.println(this.getClass());
	}

		
	@RequestMapping(value = "json/updateHeart", method = RequestMethod.POST)
	public int updateHeart(@ModelAttribute("heart") Heart heart, @RequestParam("cookNo") int cookNo,
			@RequestParam("userId") String userId

	) throws Exception {


		int heartCheck = heartService.heartCheck(cookNo, userId);
		System.out.println(heartCheck);
		if (heartCheck == 0) {
			// ���ƿ� ó������
			heartService.insertHeart(cookNo, userId); // heart���̺� ����
			heartService.updateHeart(cookNo); // ���ƿ� +1
			heartService.updateHeartCheck(cookNo, userId);// ���ƿ� check 1
		

		} else {

			heartService.updateHeartCheckCancel(cookNo, userId); // heart check0
			heartService.updateHeartCancel(cookNo); // ���ƿ� - 1
			heartService.deleteHeart(cookNo, userId); // ���ƿ� ����
		

		}
		return heartCheck;

	}
		
		
}

