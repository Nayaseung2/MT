package com.kh.mt.board.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mt.board.model.vo.Board;
import com.kh.mt.board.model.vo.BoardFile;
import com.kh.mt.common.PageInfo;

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

	// 방송국 - 내 게시판 총 글 
	@Override
	public int mbListTotal(String mId) {

		int mbListTotal = sqlSession.selectOne("Board.mbListTotal", mId);
		
		return mbListTotal;
	}

	// 방송국 - 내 게시판 목록
	@Override
	public ArrayList<Board> mbList(PageInfo pi, String mId) {

		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		ArrayList<Board> mbList = (ArrayList)sqlSession.selectList("Board.mbList", mId, rowBounds);
		
		//System.out.println("dao's mId/mbList : " + mId + "/" + mbList);
		
    	return mbList;
	}

}
