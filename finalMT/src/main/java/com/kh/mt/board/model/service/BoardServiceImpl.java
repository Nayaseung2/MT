package com.kh.mt.board.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mt.board.model.dao.BoardDao;
import com.kh.mt.board.model.vo.Board;
import com.kh.mt.board.model.vo.BoardFile;
import com.kh.mt.common.PageInfo;

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
	
	//방명록 insert
	@Override
	public void insertGuestBook(Board b) {
		int result =bd.insertGuestBook(b);
	}
	
	// 방송국 - 내 게시판 총 글
	@Override
	public int mbListTotal(String mId) {
		
		int mbListTotal = bd.mbListTotal(mId);
		
		return mbListTotal;
	}
	
	// 방송국 - 내 게시판 목록
	@Override
	public ArrayList<Board> mbList(PageInfo pi, String mId) {

		ArrayList<Board> mbList = null;
    	
		mbList = bd.mbList(pi, mId);
    	
    	return mbList;
	}
	

}
