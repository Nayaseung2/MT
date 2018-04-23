package com.kh.mt.BJPayList.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mt.BJPayList.model.dao.BJPayListDao;
import com.kh.mt.BJPayList.model.vo.BJPayList;
import com.kh.mt.BJPayList.model.vo.Expeach;
import com.kh.mt.BJPayList.model.vo.Subscribe;
import com.kh.mt.common.PageInfo;

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

	@Override
	public ArrayList<BJPayList> selectWithdrawAllList(String mcode, PageInfo pi) {
		ArrayList<BJPayList> list = bjp.selectWithdrawAllList(sqlSession, mcode , pi);
		
		return list;
	}

	@Override
	public HashMap<String, String> WithdrawListAllCount(String mcode) {
		HashMap<String, String> list = null;
		
		list = bjp.WithdrawListAllCount(sqlSession, mcode);
		
		 
		return list;
	}

	@Override
	public HashMap<String, String> ProfitBjAllCount(String mcode) {
		HashMap<String, String> list = null;
		
		list = bjp.ProfitBjAllCount(sqlSession, mcode);
		
		 
		return list;
	}

	@Override
	public ArrayList<Expeach> selectProfitBjAllList(String mcode, PageInfo pi) {
		ArrayList<Expeach> list = bjp.selectProfitBjAllList(sqlSession, mcode , pi);
		
		return list;
	}

	@Override
	public ArrayList<Expeach> selectProfitBjList(String mcode) {
		ArrayList<Expeach> list = bjp.selectProfitBjList(sqlSession, mcode);
		
		return list;
	}

	@Override
	public HashMap<String, String> MyFanAllCount(String mcode) {
		HashMap<String, String> list = null;
		
		list = bjp.MyFanAllCount(sqlSession, mcode);
		
		 
		return list;
	}

	@Override
	public ArrayList<Subscribe> selectMyFanAllList(String mcode, PageInfo pi) {
		ArrayList<Subscribe> list = bjp.selectMyFanAllList(sqlSession, mcode , pi);
		
		return list;
	}

	@Override
	public ArrayList<Subscribe> selectMyFanList(String mcode) {
		ArrayList<Subscribe> list = bjp.selectMyFanList(sqlSession, mcode);
		
		return list;
	}



}
