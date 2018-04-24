package com.kh.mt.myPage.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mt.member.model.vo.Member;
import com.kh.mt.myPage.model.dao.MyPageDao;

@Repository
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDao md;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 닉네임 중복확인
	@Override
	public String overlapCheck(String nickName) {
		
		String DBnickName = md.overlapCheck(nickName);
		
		return DBnickName;
	}

	// 닉네임 변경
	@Override
	public void changeNick(Member m) {

		int result = md.changeNick(sqlSession, m);
	}

	// 비밀번호 변경
	@Override
	public void changePwd(Member m) {

		int result = md.changePwd(sqlSession, m);
	}

	// 회원탈퇴
	@Override
	public void withdraw(String mId) {

		int result = md.withdraw(mId);
	}

	

}
