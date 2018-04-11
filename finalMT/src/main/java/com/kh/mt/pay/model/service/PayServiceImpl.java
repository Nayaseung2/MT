package com.kh.mt.pay.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mt.pay.model.dao.PayDao;
import com.kh.mt.pay.model.vo.Pay;

@Repository
public class PayServiceImpl implements PayService{

	@Autowired
	private PayDao pd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertPayList(Pay p) {
		int result = pd.insertPayList(sqlSession, p);
		
	}

	@Override
	public int selectPeach(String mcode) {
		int peach = pd.selectPeach(sqlSession, mcode);
		return peach;
		
	}
	
	

}
