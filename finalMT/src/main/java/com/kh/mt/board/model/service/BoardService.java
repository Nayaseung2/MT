package com.kh.mt.board.model.service;

import java.util.ArrayList;

import com.kh.mt.board.model.vo.Board;
import com.kh.mt.board.model.vo.BoardFile;
import com.kh.mt.common.PageInfo;

public interface BoardService {

	void insertBoard(Board b);

	void insertBoardFile(BoardFile f);

	void insertGuestBook(Board b);

	// 방송국 - 내 게시판 총 글
	int mbListTotal(String mId);

	// 방송국 - 내 게시판 목록
	ArrayList<Board> mbList(PageInfo pi, String mId);


}
