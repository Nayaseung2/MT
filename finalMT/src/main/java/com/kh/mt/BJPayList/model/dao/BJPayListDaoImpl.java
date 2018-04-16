package com.kh.mt.BJPayList.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mt.BJPayList.model.vo.BJPayList;
import com.kh.mt.pay.model.vo.Pay;

@Repository
public class BJPayListDaoImpl implements BJPayListDao{
	
	@Override
	public int selectPeach(SqlSessionTemplate sqlSession, String mcode) {
		int peach = sqlSession.selectOne("BJPayList.selectPeach", mcode);
		return peach;
	}
	
	@Override
	public int selectwdprice(SqlSessionTemplate sqlSession, String mcode) {
		int wd_price = 0;
		wd_price = sqlSession.selectOne("BJPayList.selectwdprice", mcode);

		if (wd_price == 0) {
			System.out.println("응???");
		}
		return wd_price;
	}

	@Override
	public int insertBJPayList(SqlSessionTemplate sqlSession, BJPayList bjpvo) {
		int result = sqlSession.insert("BJPayList.insertBJPayList", bjpvo);
		int peach = 0;
		if (result == 1) {
			System.out.println("result 값이..."+result);
			result = 0;
			peach = sqlSession.selectOne("BJPayList.selectPeach", bjpvo.getMcode());
			if (peach >= 0) {
				System.out.println(peach);
				int price = bjpvo.getPrice();
				
				Pay p = new Pay();
				p.setMcode(bjpvo.getMcode());
				p.setPeach_code(peach-(price/70));
				
				result=sqlSession.update("BJPayList.updatePeach", p);
			}
		}
		
		
		return result;
		
		
	}

	@Override
	public ArrayList<BJPayList> selectWithdrawList(SqlSessionTemplate sqlSession, String mcode) {
		ArrayList<BJPayList> list = null;
		
		list = (ArrayList) sqlSession.selectList("BJPayList.selectWithdrawList",mcode);
		System.out.println(list);
		
		return list;
	}


}
