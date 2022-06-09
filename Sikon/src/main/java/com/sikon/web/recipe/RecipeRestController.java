package com.sikon.web.recipe;

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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sikon.common.Page;
import com.sikon.common.Search;
import com.sikon.service.recipe.RecipeService;

//������ RestController
@RestController
@RequestMapping("/recipe/*")
public class RecipeRestController {

	/// Field

	@Autowired
	@Qualifier("recipeServiceImpl")
	private RecipeService recipeService;

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	

	public RecipeRestController() {
		System.out.println(this.getClass());
	}

	// ���ѽ�ũ��
	@RequestMapping(value = "json/listRecipe", method = RequestMethod.POST)
	public Map listRecipe(@RequestBody Search search) throws Exception {

		System.out.println("/recipe/json/listRecipe : POST");
		// Business Logic

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		System.out.println("orderCondition=" + search.getOrderCondition());

		if (search.getOrderCondition() == null) {
			search.setOrderCondition("100");
		}

		System.out.println("orderCondition=" + search.getOrderCondition());
		
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

}