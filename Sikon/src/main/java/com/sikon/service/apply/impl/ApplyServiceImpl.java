package com.sikon.service.apply.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sikon.common.Search;
import com.sikon.service.domain.Apply;

import com.sikon.service.domain.User;

import com.sikon.service.apply.ApplyDao;
import com.sikon.service.apply.ApplyService;

@Service("applyServiceImpl")
public class ApplyServiceImpl implements ApplyService {

	@Autowired
	@Qualifier("applyDaoImpl")
	private ApplyDao applyDao;

	public void setApplyDao(ApplyDao applyDao) {
		this.applyDao = applyDao;
	}

	public ApplyServiceImpl() {
		System.out.println(this.getClass());
	}

	public void addApply(Apply apply) throws Exception {

		applyDao.addApply(apply);
	}

	public Apply getApply(int applyNo) throws Exception {
		return applyDao.getApply(applyNo);
	}

	public Map<String, Object> getApplyList(Search search, String applierId) throws Exception {
		
		List<Apply> list = applyDao.getApplyList(search, applierId);
		int totalCount = applyDao.getTotalCount(search, applierId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

	public Map<String, Object> getSaleList(Search search, User user) throws Exception {
		List<Apply> list = applyDao.getSaleList(search, user);
		int totalCount = applyDao.getTotalCount2(search, user);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));

		return map;
	}

	public void updateApplyStatus(Apply apply) throws Exception {
		applyDao.updateApplyStatus(apply);
	}

	public void buyCook(int cookStatus, int cookNo) throws Exception {
		applyDao.buyCook(cookStatus, cookNo);
	}

	public void cancel(int cookStatus, int cookNo) throws Exception {
		applyDao.cancel(cookStatus, cookNo);
	}

	public List<Apply> saleCount(Apply apply) throws Exception {

		return applyDao.saleCount(apply);
	}

}