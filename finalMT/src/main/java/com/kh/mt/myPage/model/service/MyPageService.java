package com.kh.mt.myPage.model.service;

import com.kh.mt.member.model.vo.Member;

public interface MyPageService {

	// 닉네임 중복확인
	String overlapCheck(String nickName);

	// 닉네임 변경
	void changeNick(Member m);


}
