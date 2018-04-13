package com.kh.mt.board.model.dao;
   
import com.kh.mt.board.model.vo.Board;
import com.kh.mt.board.model.vo.BoardFile;

public interface BoardDao {

	int insertBoard(Board b);

	int insertBoardFile(BoardFile f);

}
