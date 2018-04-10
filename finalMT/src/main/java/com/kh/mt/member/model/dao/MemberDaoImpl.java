package com.kh.mt.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.mt.member.model.vo.Member;
import com.kh.mt.member.model.vo.NaverLoginMember;

@Repository
public class MemberDaoImpl implements MemberDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("Member.insertMember", m);
	}

	@Override
	public Member loginCheck(Member m) {
		Member member=null;
		String cryptPwd = sqlSession.selectOne("Member.selectPwd",m.getmId());
		if(!passwordEncoder.matches(m.getmPwd(), cryptPwd)){
			System.out.println("로그인 실패");
		}else{
			member= sqlSession.selectOne("Member.loginCheck", m);
		}
		return member;
	}

	@Override
	public String overlapCheck(String mId) {
		String DBuserId="";
		DBuserId = sqlSession.selectOne("Member.overlapCheck",mId);
		return DBuserId;
	}

	//naver이메일이 아이디가 있는지 없는지 확인
	@Override
	public Member selecOne(String email) {
		Member m = null;
		m=sqlSession.selectOne("Member.selectNaverOne",email);
		return m;
	}

	//naver ID Input
	@Override
	public int insertNaverMember(NaverLoginMember nlm) {
		System.out.println("DAO nlm : "+nlm);
		return sqlSession.insert("Member.insertNaverMember", nlm);
	}

}
