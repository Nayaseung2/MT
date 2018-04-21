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

}
