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
		int result = sqlSession.insert("Pay.insertPayList", p);
		
		if (result == 1) {
			int peach = sqlSession.selectOne("Pay.selectPeach", p.getMcode());
			System.out.println(peach);
			int peachsum = peach+Integer.parseInt(p.getPeach_code());
			
			HashMap<String, Object> hmap = new HashMap<String, Object>();
			hmap.put("peach", peachsum);
			hmap.put("mcode", p.getMcode());
			
			
			
			result=sqlSession.update("Pay.updatePeach", hmap);
		}else{
			
		}
		
		
		
		
		return result;
	}


	
	
}
