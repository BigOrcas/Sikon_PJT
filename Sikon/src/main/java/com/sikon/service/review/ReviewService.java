package com.sikon.service.review;

import java.util.Map;

import com.sikon.common.Search;
import com.sikon.service.domain.Review;

//���信�� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface ReviewService {

	//���� ���
	public void addReview(Review review) throws Exception;

	//���� ����Ʈ ��ȸ
	public Map<String, Object> getReviewList(Search search,String category, int textNo) throws Exception;

	public Map<String, Object> getMyReviewList(Search search, String writerNickname) throws Exception;

	public Review getReview(int reviewNo) throws Exception;
	
	//���� ����
	public void updateReview(Review review) throws Exception;

	//���� ����
	public void deleteReview(int reviewNo) throws Exception;

	public void updateStatus(int textNo,String category) throws Exception;
	
	public void givePoint(int point,String userId) throws Exception;

}
