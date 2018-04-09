package com.kh.mt.member.model.sevice;

import com.kh.mt.member.model.vo.Member;

public interface MemberService {

	void insertMember(Member m);

	Member loginCheck(Member m);

	String overlapCheck(String mId);


}
