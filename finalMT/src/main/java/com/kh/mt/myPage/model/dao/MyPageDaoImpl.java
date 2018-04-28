package com.kh.mt.myPage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.mt.board.model.vo.Board;
import com.kh.mt.common.PageInfo;
import com.kh.mt.member.model.vo.Member;
import com.kh.mt.reply.model.vo.ReplyVo;

@Repository
public class MyPageDaoImpl implements MyPageDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	// 닉네임 중복확인
	@Override
	public String overlapCheck(String nickName) {
		
		String DBnickName = "";
		
		DBnickName = sqlSession.selectOne("MyPage.overlapCheck", nickName);
		
		return DBnickName;
	}
	
	// 닉네임 변경
	@Override
	public int changeNick(SqlSessionTemplate sqlSession, Member m) {

		//System.out.println("dao's m : " + m);
		
		int result = sqlSession.update("MyPage.changeNick", m);
		
		return result;
	}

	// 비밀번호 변경
	@Override
	public int changePwd(SqlSessionTemplate sqlSession, Member m) {

		//System.out.println("dao's m : " + m);
		
		int result = sqlSession.update("MyPage.changePwd", m);
		
		return result;
	}

	// 회원 탈퇴
	@Override
	public int withdraw(String mId) {

		//System.out.println("dao's mId : " + mId);
		
		int result = sqlSession.update("MyPage.withdraw", mId);
		
		return result;
	}

	// 질문 내역 리스트
	@Override
	public ArrayList<Board> pList(PageInfo pi, String mId) {

		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		ArrayList<Board> pList = (ArrayList)sqlSession.selectList("MyPage.pList", mId, rowBounds);
		
    	//System.out.println("dao's pList : " + pList);
    	
    	return pList;
	}

	// 총 질문글 수
	@Override
	public int pListTotal(String mId) {

		int pListTotal = sqlSession.selectOne("MyPage.pListTotal", mId);
		
		//System.out.println("dao's pListTotal : " + pListTotal);
		
		return pListTotal;
	}

	// 질문 답변
	@Override
	public ArrayList<ReplyVo> paList(String b_code) {

		ArrayList<ReplyVo> paList = (ArrayList)sqlSession.selectList("MyPage.paList", b_code);
		
		//System.out.println("dao's b_code/paList : " + b_code + "/" + paList);
		
		return paList;
	}
	
	



}
