package com.kh.mt.member.model.sevice;

import com.kh.mt.member.model.vo.Member;
import com.kh.mt.member.model.vo.NaverLoginMember;

public interface MemberService {

	void insertMember(Member m);

	Member loginCheck(Member m);

	String overlapCheck(String mId);

	Member selectOne(String email);

	void insertNaverMember(NaverLoginMember nlm);


}
