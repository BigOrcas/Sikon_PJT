package com.sikon.web.ranking;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sikon.common.Page;
import com.sikon.common.Search;
import com.sikon.service.domain.Recipe;
import com.sikon.service.recipe.RecipeService;

//������ RestController
@RestController
@RequestMapping("/ranking/*")
public class RankingRestController {

	/// Field

	@Autowired
	@Qualifier("recipeServiceImpl")
	private RecipeService recipeService;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	

	public RankingRestController() {
		System.out.println(this.getClass());
	}

	// ���ѽ�ũ��
	@RequestMapping(value = "json/listRecipe", method = RequestMethod.POST)
	public Map listRecipe(@RequestBody Search search) throws Exception {

		System.out.println("/ranking/json/listRecipe : POST");
		// Business Logic

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		
		if(search.getSearchCondition()==null) {
			search.setSearchCondition("0");
		}

		if (search.getOrderCondition() == null) {
			search.setOrderCondition("4");
		}
		
		search.setPageSize(pageSize);

		Map<String, Object> map = recipeService.getRecipeList(search);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
				pageSize);
		System.out.println(resultPage);

		Map map2 = new HashMap();
		map2.put("list", map.get("list"));
		map2.put("resultPage", map);
		map2.put("search", search);

		System.out.println("map=" + map);
		return map2;
	}

	@RequestMapping(value = "json/uploadSummernoteImageFile")
	public Map uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {

		System.out.println("��ӳ�Ʈ json/imageUpload");

		 Map map = new HashMap();
			
			
			String fileRoot = "C:\\summernote_image\\"; // ����� �ܺ� ���� ���
	        String originalFileName = multipartFile.getOriginalFilename();	//�������� ���ϸ�
	        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//���� Ȯ����

	        // ���� UUID+Ȯ���ڷ� ����� savedFileName
	        String savedFileName = UUID.randomUUID() + extension;	
	        
	        System.out.println("2: "+savedFileName);
	        
	        File targetFile = new File(fileRoot + savedFileName);
	        
	        System.out.println("3: "+targetFile);

	        try {
	            InputStream fileStream = multipartFile.getInputStream();
	            FileUtils.copyInputStreamToFile(fileStream,targetFile);	//���� ����
	            //jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
	            map.put("url", "/summernoteImage/"+savedFileName);
	            //jsonObject.addProperty("responseCode", "success");
	            map.put("responseCode", "success");

	        } catch (IOException e) {
	            FileUtils.deleteQuietly(targetFile);	// ���н� ����� ���� ����
	            //jsonObject.addProperty("responseCode", "error");
	            map.put("responseCode", "error");
	            e.printStackTrace();
	        }

	        
	        
	        System.out.println("4: "+map);
	        
	        return map;
	}
	
	//���ƿ� push �˸�
	@RequestMapping(value="/json/pushAlarm", method=RequestMethod.POST)
	@ResponseBody
	public Map pushAlram(@RequestParam("recipeNo") int recipeNo, @RequestParam("userId") String userId, @RequestParam("userNickname") String userNickname) {
				
		Map map = new HashMap();
		
		try{
			Recipe recipe = recipeService.getRecipeName(recipeNo);
			
			map.put("userId", userId);
			map.put("userNickname", userNickname);
			map.put("recipeName", recipe.getRecipeName());
			map.put("writerId", recipe.getWriter().getUserId());
			map.put("responseCode", "success");
		
		}catch (Exception e){
			e.printStackTrace();
		}
		
		return map;	
	}

}