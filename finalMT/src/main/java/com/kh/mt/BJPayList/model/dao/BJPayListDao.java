package com.kh.mt.BJPayList.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mt.BJPayList.model.vo.BJPayList;

public interface BJPayListDao {

	int selectPeach(SqlSessionTemplate sqlSession, String mcode);

	int insertBJPayList(SqlSessionTemplate sqlSession, BJPayList bjpvo);

	int selectwdprice(SqlSessionTemplate sqlSession, String mcode);

	ArrayList<BJPayList> selectWithdrawList(SqlSessionTemplate sqlSession, String mcode);


}
