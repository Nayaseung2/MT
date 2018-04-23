package com.kh.mt.helpcenter.model.sevice;

import java.util.ArrayList;

import com.kh.mt.board.model.vo.BoardFile;
import com.kh.mt.common.PageInfo;
import com.kh.mt.helpcenter.model.vo.HelpMainVo;

public interface HelpService {

	// 고객센터 메인화면(=자주묻는 질문)
	ArrayList<HelpMainVo> listAll(String b_type) throws Exception;

	// 자주묻는 질문 검색
	ArrayList<HelpMainVo> sList(String word);

	// 1:1 문의글 
	void personal(HelpMainVo hm);

	// 신고대상 아이디 체크
	String bullyIdCheck(String bullyId);
	
	// 신고하기(신고대상 아이디/내용)
	void report(HelpMainVo hm);

	// 신고하기(파일)
	void reportFile(BoardFile bf);

	// 공지글 목록
	ArrayList<HelpMainVo> nList(PageInfo pi);

	// 공지글 상세보기
	ArrayList<HelpMainVo> nListDetail(String b_code);

	// 총 공지글 수
	int nListTotal();


}
