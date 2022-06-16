package com.sikon.web.review;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sikon.common.Page;
import com.sikon.common.Search;
import com.sikon.service.cook.CookService;
import com.sikon.service.domain.Cook;
import com.sikon.service.domain.Point;
import com.sikon.service.domain.Product;
import com.sikon.service.domain.Recipe;
import com.sikon.service.domain.Review;
import com.sikon.service.domain.User;
import com.sikon.service.point.PointService;
import com.sikon.service.product.ProductService;
import com.sikon.service.recipe.RecipeService;
import com.sikon.service.review.ReviewService;
import com.sikon.service.user.UserService;

@Controller
@RequestMapping("/review/*")
public class ReviewRestController {

	/// Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	@Autowired
	@Qualifier("recipeServiceImpl")
	private RecipeService recipeService;


	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;

	public ReviewRestController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@Value("#{commonProperties['filepath']}")
	String filePath;

	@RequestMapping(value = "json/addReview", method = RequestMethod.POST)
	public String addReview(@RequestParam("writerNickname") String writerNickname,@RequestParam("reviewContent") String reviewContent,
			@RequestParam("textNo") int textNo, Model model) throws Exception {

		System.out.println("/review/addReview : POST");
		System.out.println("review="+reviewContent);
		System.out.println("writerNickname="+writerNickname);
		System.out.println("textNo="+textNo);
		
		Recipe recipe = recipeService.getRecipeName(textNo);
		Review review=new Review();
		
		review.setRecipe(recipe);
		review.setReviewContent(reviewContent);
		review.setWriterNickname(writerNickname);
		review.setReviewCategory("REC");

		System.out.println("����:" + review);
		reviewService.addReview(review);
		

		String content=review.getReviewContent();
		return content;
	}

//	@RequestMapping(value = "updateReview", method = RequestMethod.GET)
//	public ModelAndView updateReview(@RequestParam("reviewNo") int reviewNo, HttpServletRequest request)
//			throws Exception {
//		System.out.println("/review/updateReview : GET");
////		System.out.println("reviewNo=" + reviewNo);
//
//		Review review = reviewService.getReview(reviewNo);
//
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.addObject(review);
//		modelAndView.setViewName("forward:/review/updateReview.jsp");
//
//		return modelAndView;
//	}
//
//	@RequestMapping(value = "updateReview", method = RequestMethod.POST)
//	public String updateReview(@ModelAttribute("review") Review review, Model model, HttpServletRequest request)
//			throws Exception {
//		System.out.println("/review/updateReview : POST");
////		System.out.println("review=" + review);
//
//		model.addAttribute("msg", "���� ������ �Ϸ�Ǿ����ϴ�.");
//		model.addAttribute("url", "/review/updateReview.jsp");
//
//		reviewService.updateReview(review);
//
//		return "forward:/review/test.jsp";
//	}
//
//	// ���� �� ����(����������)
//	@RequestMapping(value = "listMyReview")
//	public ModelAndView listMyRecipe(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
//			throws Exception {
//
//		System.out.println("/review/listMyReview :  POST/get");
//
////		System.out.println("search:" + search);
//
//		if (search.getCurrentPage() == 0) {
//			search.setCurrentPage(1);
//		}
//
//		search.setPageSize(10);
//
//		HttpSession session = request.getSession();
//		User user = (User) session.getAttribute("user");
//
//		Map<String, Object> map = reviewService.getMyReviewList(search, user.getUserNickname());
//
//		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit, 10);
//
////		System.out.println("list=" + map.get("list"));
////		System.out.println("resultPage=" + resultPage);
//
//		// Model �� View ����
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.addObject("list", map.get("list"));
//		modelAndView.addObject("resultPage", resultPage);
//		modelAndView.addObject("search", search);
//		modelAndView.setViewName("forward:/mypage/listMyReview.jsp");
//
//		return modelAndView;
//	}
//
//	// ���� ���� ����
//	@RequestMapping(value = "deleteReview")
//	public String deleteReview(@RequestParam("checkList") int[] reviewList) throws Exception {
//
//		System.out.println("/review/deleteReview : POST");
//
//		for (int i = 0; i < reviewList.length; i++) {
//			System.out.println(reviewList[i]);
//		}
//
//		for (int i = 0; i < reviewList.length; i++) {
//			reviewService.deleteReview(reviewList[i]);
//		}
//
//		return "redirect:/review/listMyReview";
//
//	}
}