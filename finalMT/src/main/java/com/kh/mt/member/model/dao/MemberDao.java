package com.kh.mt.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mt.member.model.vo.Member;

public interface MemberDao {

	int insertMember(SqlSessionTemplate sqlSession, Member m);

	Member loginCheck(Member m);

	String overlapCheck(String mId);

}
