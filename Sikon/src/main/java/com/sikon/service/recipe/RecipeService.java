package com.sikon.service.recipe;

import java.util.List;
import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Recipe;

//레시피에서 서비스할 내용 추상화/캡슐화한 Service  Interface Definition  
public interface RecipeService {

	// 레시피 등록
	public void addRecipe(Recipe recipe, Map ingredient) throws Exception;

	// 레시피 상세 조회(레시피+재료)
	public List getRecipe(int recipeNo) throws Exception;
	
	// 레시피만 조회
	public Recipe getRecipeName(int recipeNo) throws Exception;

	// 레시피 리스트 조회
	public Map<String, Object> getRecipeList(Search search) throws Exception;

	// 내가 쓴 레시피 조회(마이페이지)
	public Map<String, Object> getMyRecipeList(Search search, String writerNickname) throws Exception;

	// 레시피 수정
	public void updateRecipe(Recipe recipe, Map ingredient) throws Exception;
	
	// 레시피 수정(Ingredient 제외)
	public void updateRecipeOnly(Recipe recipe) throws Exception;

	// 레시피 삭제
	public void deleteRecipe(int recipeNo) throws Exception;

	
}
