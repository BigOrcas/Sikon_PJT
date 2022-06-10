package com.sikon.web.review;

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
import org.springframework.web.servlet.ModelAndView;

import com.sikon.common.Page;
import com.sikon.common.Search;
import com.sikon.service.apply.ApplyService;
import com.sikon.service.domain.Cook;
import com.sikon.service.domain.Product;
import com.sikon.service.domain.Recipe;
import com.sikon.service.domain.Review;
import com.sikon.service.domain.User;
import com.sikon.service.product.ProductService;
import com.sikon.service.purchase.PurchaseService;
import com.sikon.service.review.ReviewService;
import com.sikon.service.user.UserService;

@Controller
@RequestMapping("/review/*")
public class ReviewController {

	/// Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("applyServiceImpl")
	private ApplyService applyService;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;

	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;

	public ReviewController() {
		System.out.println(this.getClass());
	}

	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value = "addReview", method = RequestMethod.POST)
	public ModelAndView addReview(@ModelAttribute("review") Review review, @RequestParam("category") String category,
			@RequestParam("textNo") int textNo,HttpServletRequest request) throws Exception {

		System.out.println("/review/addReview : POST");
		System.out.println("review=" + review);
		System.out.println("category=" + category);
		System.out.println("textNo=" + textNo);

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		Recipe recipe = new Recipe();
		Product product = new Product();
		Cook cook = new Cook();

		if (category.equals("COOK")) {
			cook.setCookNo(textNo);
			review.setCook(cook);
		} else if (category.equals("PRD")) {
			product.setProdNo(textNo);
			review.setProduct(product);
		} else {
			recipe.setRecipeNo(textNo);
			review.setRecipe(recipe);
		}

		review.setWriterNickname(user.getUserNickname());
		review.setReviewCategory(category);
		
		System.out.println("리뷰:" + review);
		reviewService.addReview(review);
		
		// 리뷰 작성시 일반리뷰: 100원, 포토리뷰: 500원 적립금
		if(!category.equals("REC") && (review.getReviewImg()!=null ||review.getReviewImg()!="")) {
			reviewService.givePoint(500, user.getUserId());
		}else if(!category.equals("REC") && (review.getReviewImg()==null ||review.getReviewImg()=="")) {
			reviewService.givePoint(100, user.getUserId());
		}
		reviewService.updateStatus(textNo, category);
		
		ModelAndView modelAndView = new ModelAndView();
		if(category.equals("REC")) {
			modelAndView.addObject(review);
			modelAndView.setViewName("forward:/recipe/getRecipe?recipeNo="+textNo);
		}
		return modelAndView;
	}
	
	// 내가 쓴 리뷰(마이페이지)
		@RequestMapping(value = "listMyReview")
		public ModelAndView listMyRecipe(@ModelAttribute("search") Search search, Model model, HttpServletRequest request)
				throws Exception {

			System.out.println("/review/listMyReview :  POST/get");

			System.out.println("search:" + search);

			if (search.getCurrentPage() == 0) {
				search.setCurrentPage(1);
			}

			search.setPageSize(pageSize);

			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");

			Map<String, Object> map = reviewService.getMyReviewList(search,user.getUserNickname() );

			Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,
					pageSize);

			System.out.println("list=" + map.get("list"));
			System.out.println("resultPage=" + resultPage);

			// Model 과 View 연결
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("list", map.get("list"));
			modelAndView.addObject("resultPage", resultPage);
			modelAndView.addObject("search", search);
			modelAndView.setViewName("forward:/mypage/listMyReview.jsp");

			return modelAndView;
		}
		
		// 리뷰 선택 삭제
		@RequestMapping(value = "deleteReview")
		public String deleteReview(@RequestParam("checkList") int[] reviewList) throws Exception {

			System.out.println("/review/deleteReview : POST");

			for (int i = 0; i < reviewList.length; i++) {
				System.out.println(reviewList[i]);
			}

			for (int i = 0; i < reviewList.length; i++) {
				reviewService.deleteReview(reviewList[i]);
			}

			return "redirect:/mypage/listMyReview.jsp";
		}

}