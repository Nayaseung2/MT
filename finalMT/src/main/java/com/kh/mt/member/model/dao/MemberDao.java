package com.kh.mt.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mt.member.model.vo.Member;
import com.kh.mt.member.model.vo.NaverLoginMember;

public interface MemberDao {

	int insertMember(SqlSessionTemplate sqlSession, Member m);

	Member loginCheck(Member m);

	String overlapCheck(String mId);

	Member selecOne(String email);

	int insertNaverMember(NaverLoginMember nlm);

	int insertJDBCStation(String mid);

	// 이름으로 아이디 가져오기
	String checkNameId(String joinName);

	// 이메일로 아이디 가져오기
	String checkEmailId(String joinEmail);

	// 임시비번으로 DB비번 재설정
	int tempPwd(SqlSessionTemplate sqlSession, Member m);


}
