package com.kh.mt.member.model.sevice;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;

import com.kh.mt.member.model.dao.MemberDao;
import com.kh.mt.member.model.vo.Member;
import com.kh.mt.member.model.vo.NaverLoginMember;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao md;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void insertMember(Member m) {
		int result=md.insertMember(sqlSession,m);
	}

	@Override
	public Member loginCheck(Member m) {
		return md.loginCheck(m);
	}

	//Id 중복체크
	@Override
	public String overlapCheck(String mId) {
		String DBuserId=md.overlapCheck(mId);
		return DBuserId;
	}

	//naver로그인 id 중복체크
	@Override
	public Member selectOne(String email) {
		Member m = null;
		m=md.selecOne(email);
		return m;
	}

	//naver 아이디 input
	@Override
	public void insertNaverMember(NaverLoginMember nlm) {
		int result=md.insertNaverMember(nlm);
	}

	
	//회원가입시 방송국 생성
	@Override
	public void insertJDBCStation(String mid) {
		int result=md.insertJDBCStation(mid);
		System.out.println("방송국 생성함? result : "+result);
	}

	// 이름으로 아이디 가져오기
	@Override
	public String checkNameId(String joinName) {

		String nameId = "";
		
		nameId = md.checkNameId(joinName);
		
		return nameId;
	}

	// 이메일로 아이디 가져오기
	@Override
	public String checkEmailId(String joinEmail) {

		String emailId = "";
		
		emailId = md.checkEmailId(joinEmail);
		
		return emailId;
	}

	
}
