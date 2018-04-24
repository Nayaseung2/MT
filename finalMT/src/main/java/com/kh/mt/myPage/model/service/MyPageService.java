package com.kh.mt.myPage.model.service;

import com.kh.mt.member.model.vo.Member;

public interface MyPageService {

	// 닉네임 중복확인
	String overlapCheck(String nickName);

	// 닉네임 변경
	void changeNick(Member m);
	
	// 비밀번호 변경
	void changePwd(Member m);

	// 회원탈퇴
	void withdraw(String mId);


}
