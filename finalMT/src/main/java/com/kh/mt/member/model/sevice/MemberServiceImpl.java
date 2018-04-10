package com.kh.mt.member.model.sevice;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;

import com.kh.mt.member.model.dao.MemberDao;
import com.kh.mt.member.model.vo.Member;

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

	
}