package com.kh.mt.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mt.board.model.vo.Board;
import com.kh.mt.board.model.vo.BoardFile;

@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//board insert
	@Override
	public int insertBoard(Board b) {
		return sqlSession.insert("Board.insertBoard",b);
	}

	//boardFile insert
	@Override
	public int insertBoardFile(BoardFile f) {
		return sqlSession.insert("Board.insertBoardFile",f);
	}

	//방명록 insert
	@Override
	public int insertGuestBook(Board b) {
		return sqlSession.insert("Board.insertGuestBook",b);
	}

}
