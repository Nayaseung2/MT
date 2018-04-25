package com.kh.mt.member.model.sevice;

import com.kh.mt.member.model.vo.Member;
import com.kh.mt.member.model.vo.NaverLoginMember;

public interface MemberService {

	void insertMember(Member m);

	Member loginCheck(Member m);

	String overlapCheck(String mId);

	Member selectOne(String email);

	void insertNaverMember(NaverLoginMember nlm);

	void insertJDBCStation(String mid);

	// 이름으로 아이디 가져오기
	String checkNameId(String joinName);

	// 이메일로 아이디 가져오기
	String checkEmailId(String joinEmail);



}
