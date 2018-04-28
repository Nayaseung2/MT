package com.kh.mt.myPage.model.service;

import java.util.ArrayList;

import com.kh.mt.board.model.vo.Board;
import com.kh.mt.common.PageInfo;
import com.kh.mt.member.model.vo.Member;
import com.kh.mt.reply.model.vo.ReplyVo;

public interface MyPageService {

	// 닉네임 중복확인
	String overlapCheck(String nickName);

	// 닉네임 변경
	void changeNick(Member m);
	
	// 비밀번호 변경
	void changePwd(Member m);

	// 회원탈퇴
	void withdraw(String mId);

	// 질문 내역 리스트
	ArrayList<Board> pList(PageInfo pi, String mId);

	// 총 질문글 수
	int pListTotal(String mId);

	// 질문 답변
	ArrayList<ReplyVo> paList(String b_code);


}
