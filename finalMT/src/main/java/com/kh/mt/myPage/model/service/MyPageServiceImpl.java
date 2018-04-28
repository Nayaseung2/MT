package com.kh.mt.myPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mt.board.model.vo.Board;
import com.kh.mt.common.PageInfo;
import com.kh.mt.member.model.vo.Member;
import com.kh.mt.myPage.model.dao.MyPageDao;
import com.kh.mt.reply.model.vo.ReplyVo;

@Repository
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDao md;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 닉네임 중복확인
	@Override
	public String overlapCheck(String nickName) {
		
		String DBnickName = md.overlapCheck(nickName);
		
		return DBnickName;
	}

	// 닉네임 변경
	@Override
	public void changeNick(Member m) {

		int result = md.changeNick(sqlSession, m);
	}

	// 비밀번호 변경
	@Override
	public void changePwd(Member m) {

		int result = md.changePwd(sqlSession, m);
	}

	// 회원탈퇴
	@Override
	public void withdraw(String mId) {

		int result = md.withdraw(mId);
	}

	// 질문 내역 리스트
	@Override
	public ArrayList<Board> pList(PageInfo pi, String mId) {

		ArrayList<Board> pList = null;
    	
		pList = md.pList(pi, mId);
    	
    	return pList;
	}

	// 총 질문글 수
	@Override
	public int pListTotal(String mId) {

		int pListTotal = md.pListTotal(mId);
		
		return pListTotal;
	}

	// 질문 답변
	@Override
	public ArrayList<ReplyVo> paList(String b_code) {
		
		ArrayList<ReplyVo> paList = null;
		
		paList = md.paList(b_code);
		
		return paList;
	}

	

}
