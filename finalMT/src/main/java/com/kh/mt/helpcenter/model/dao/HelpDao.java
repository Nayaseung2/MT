package com.kh.mt.helpcenter.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mt.board.model.vo.BoardFile;
import com.kh.mt.common.PageInfo;
import com.kh.mt.helpcenter.model.vo.HelpMainVo;

public interface HelpDao {
	
	// 고객센터 메인화면(=자주묻는 질문)
    ArrayList<HelpMainVo> listAll(String b_type) throws Exception;

    // 자주묻는 질문 검색
	ArrayList<HelpMainVo> sList(String word);

	// 1:1 문의글
	int personal(SqlSessionTemplate sqlSession, HelpMainVo hm);

	// 신고대상 아이디 체크
	String bullyIdCheck(String bullyId);
	
	// 신고하기(신고대상 아이디/내용)
	int report(SqlSessionTemplate sqlSession, HelpMainVo hm);

	// 신고하기(파일)
	int reportFile(SqlSessionTemplate sqlSession, BoardFile bf);

	// 공지글 목록
	ArrayList<HelpMainVo> nList(PageInfo pi);

	// 공지글 상세보기
	ArrayList<HelpMainVo> nListDetail(String b_code);

	// 총 공지글 수
	int nListTotal();

	// 게시글 조회수
	int updateCount(String b_code);

	
}
