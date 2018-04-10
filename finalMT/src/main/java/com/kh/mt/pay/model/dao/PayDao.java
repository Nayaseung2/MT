package com.kh.mt.pay.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mt.pay.model.vo.Pay;

public interface PayDao {

	int insertPayList(SqlSessionTemplate sqlSession, Pay p);

}
