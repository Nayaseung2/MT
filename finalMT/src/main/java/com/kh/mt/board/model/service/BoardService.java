package com.kh.mt.board.model.service;

import com.kh.mt.board.model.vo.Board;
import com.kh.mt.board.model.vo.BoardFile;

public interface BoardService {

	void insertBoard(Board b);

	void insertBoardFile(BoardFile f);
  
}
