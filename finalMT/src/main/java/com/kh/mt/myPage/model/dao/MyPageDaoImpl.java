package com.kh.mt.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.mt.member.model.vo.Member;

@Repository
public class MyPageDaoImpl implements MyPageDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	// 닉네임 중복확인
	@Override
	public String overlapCheck(String nickName) {
		
		String DBnickName = "";
		
		DBnickName = sqlSession.selectOne("MyPage.overlapCheck", nickName);
		
		return DBnickName;
	}
	
	// 닉네임 변경
	@Override
	public int changeNick(SqlSessionTemplate sqlSession, Member m) {

		System.out.println("dao's m : " + m);
		
		int result = sqlSession.update("MyPage.changeNick", m);
		
		return result;
	}

	// 비밀번호 변경
	@Override
	public int changePwd(SqlSessionTemplate sqlSession, Member m) {

		System.out.println("dao's m : " + m);
		
		int result = sqlSession.update("MyPage.changePwd", m);
		
		return result;
	}



}
