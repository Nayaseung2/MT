package com.kh.mt.pay.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mt.pay.model.vo.Pay;

@Service
public class PayDaoImpl implements PayDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertPayList(SqlSessionTemplate sqlSession, Pay p) {
		System.out.println(p);
		int result = sqlSession.insert("Pay.insertPayList", p);
		int peach = 0;
		if (result == 1) {
			result = 0;
			peach = sqlSession.selectOne("Pay.selectPeach", p.getMcode());
			if (peach >= -1) {
				System.out.println(peach);
				int peachsum = peach+p.getPeach_code();
				p.setPeach_code(peachsum);
				
				result=sqlSession.update("Pay.updatePeach", p);
			}
		}
		return result;
	}

	@Override
	public int selectPeach(SqlSessionTemplate sqlSession, String mcode) {
		int peach = sqlSession.selectOne("Pay.selectPeach", mcode);
		return peach;
	}


	
	
}
