package com.kh.mt.helpcenter.model.sevice;

import java.util.ArrayList;

import com.kh.mt.board.model.vo.BoardFile;
import com.kh.mt.helpcenter.model.vo.HelpMainVo;

public interface HelpService {

	// 고객센터 메인화면(=자주묻는 질문)
	ArrayList<HelpMainVo> listAll(String b_type) throws Exception;

	// 자주묻는 질문 검색
	ArrayList<HelpMainVo> sList(String word);

	// 1:1 문의글 
	void personal(HelpMainVo hm);

	// 신고하기(제목/내용)
	void report(HelpMainVo hm);

	// 신고하기(파일)
	void reportFile(BoardFile bf);

	// 공지글 목록
	ArrayList<HelpMainVo> nList();

}
