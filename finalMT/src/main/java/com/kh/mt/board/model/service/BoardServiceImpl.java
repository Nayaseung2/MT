package com.kh.mt.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mt.board.model.dao.BoardDao;
import com.kh.mt.board.model.vo.Board;
import com.kh.mt.board.model.vo.BoardFile;
  
@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	BoardDao bd;
	@Override
	public void insertBoard(Board b) {
		int result =bd.insertBoard(b); 
	}
	//방송국에서 글쓰기
	@Override
	public void insertBoardFile(BoardFile f) {
		int result =bd.insertBoardFile(f);
	}
	
	//방송국에서 쓴 게시판

}
