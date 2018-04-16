package com.kh.mt.pay.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kh.mt.pay.model.dao.PayDao;
import com.kh.mt.pay.model.vo.Pay;

@Service
public class PayServiceImpl implements PayService{

	@Autowired
	private PayDao pd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertPayList(Pay p) {
		System.out.println("여기까지 오기는 하니...");
		int result = pd.insertPayList(sqlSession, p);
		System.out.println("service result"+result);
		
	}

	@Override
	public int selectPeach(String mcode) {
		int peach = pd.selectPeach(sqlSession, mcode);
		return peach;
		
	}
	
	

}
