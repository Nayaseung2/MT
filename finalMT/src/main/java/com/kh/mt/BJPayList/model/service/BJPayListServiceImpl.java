package com.kh.mt.BJPayList.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mt.BJPayList.model.dao.BJPayListDao;
import com.kh.mt.BJPayList.model.vo.BJPayList;

@Service
public class BJPayListServiceImpl implements BJPayListService{

	@Autowired
	private BJPayListDao bjp;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectPeach(String mcode) {
		System.out.println(mcode);
		int peach = bjp.selectPeach(sqlSession, mcode);
		
		return peach;
	}
	
	@Override
	public int selectwdprice(String mcode) {
		int wd_price = bjp.selectwdprice(sqlSession, mcode);
		System.out.println("값이 어떩게 들어오는데??? 그래야 변경을해주지..."+wd_price);
		return wd_price;
	}

	@Override
	public void insertBJPayList(BJPayList bjpvo) {
		System.out.println(bjpvo);
		int result = bjp.insertBJPayList(sqlSession, bjpvo);
		
		
	}

	@Override
	public ArrayList<BJPayList> selectWithdrawList(String mcode) {
		ArrayList<BJPayList> list = bjp.selectWithdrawList(sqlSession, mcode);
		
		return list;
	}


}
