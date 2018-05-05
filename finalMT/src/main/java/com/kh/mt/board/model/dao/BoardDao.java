package com.kh.mt.board.model.dao;

import java.util.ArrayList;

import com.kh.mt.board.model.vo.Board;
import com.kh.mt.board.model.vo.BoardFile;
import com.kh.mt.common.PageInfo;

public interface BoardDao {

	int insertBoard(Board b);

	int insertBoardFile(BoardFile f);

	int insertGuestBook(Board b);

	// 방송국 - 내 게시판 총 글
	int mbListTotal(String mId);

	// 방송국 - 내 게시판 목록
	ArrayList<Board> mbList(PageInfo pi, String mId);

	// 방송국 - 내 게시판 상세보기
	Board mbListDetail(Board b);

	// 방송국 - 내 게시판 상세보기 (사진)
	BoardFile mbListDetailP(BoardFile bf);

	// 방송국 - 내 게시판 글 삭제
	int BSmyBoardDelete(String b_code);

	// 방송국 - 방명록 목록
	ArrayList<Board> gList(String mId);

}
