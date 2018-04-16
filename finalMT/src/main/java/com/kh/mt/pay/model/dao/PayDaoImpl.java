package com.kh.mt.pay.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kh.mt.pay.model.vo.Pay;

@Repository
public class PayDaoImpl implements PayDao{
	
	@Override
	public int insertPayList(SqlSessionTemplate sqlSession, Pay p) {
		System.out.println("이거 왜 안나와??"+p);
		int result = sqlSession.insert("Pay.insertPayList", p);
		int peach = 0;
		if (result == 1) {
			System.out.println("result 값이..."+result);
			result = 0;
			peach = sqlSession.selectOne("Pay.selectPeach", p.getMcode());
			if (peach >= 0) {
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
