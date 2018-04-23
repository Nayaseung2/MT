package com.kh.mt.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mt.member.model.vo.Member;

public interface MyPageDao {

	// 닉네임 중복확인
	String overlapCheck(String nickName);
	
	// 닉네임 변경
	int changeNick(SqlSessionTemplate sqlSession, Member m);

	// 비밀번호 변경
	int changePwd(SqlSessionTemplate sqlSession, Member m);



}
