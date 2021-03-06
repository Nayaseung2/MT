package com.kh.mt.board.model.dao;

import java.util.ArrayList;


import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mt.board.model.vo.Board;
import com.kh.mt.board.model.vo.BoardFile;
import com.kh.mt.common.PageInfo;
import com.kh.mt.reply.model.vo.ReplyVo;

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

	// 방송국 - 내 게시판 상세보기
	@Override
	public Board mbListDetail(Board b) {

		Board mbListDetail = sqlSession.selectOne("Board.mbListDetail", b);
		
		//System.out.println("dao's 글 시간 : "  + mbListDetail.getB_create_date());
		
		return mbListDetail;
	}

	// 방송국  - 내 게시판 상세보기(사진)
	@Override
	public BoardFile mbListDetailP(BoardFile bf) {
		
		BoardFile mbListDetailP = sqlSession.selectOne("Board.mbListDetailP", bf);
		
		//System.out.println("dao's 사진 시간 : "  + mbListDetailP.getUpload_date());
		
		return mbListDetailP;
	}

	// 방송국 - 내 게시판 글 삭제
	@Override
	public int BSmyBoardDelete(String b_code) {
		
		System.out.println("dao's b_code : " + b_code);

		int result = sqlSession.update("Board.mbListDelete", b_code);
		
		return result;
	}

	// 방송국 - 방명록 목록
	@Override
	public ArrayList<Board> gList(String mId) {
		
		ArrayList<Board> gList = (ArrayList)sqlSession.selectList("Board.gList", mId);
		
		return gList;
	}

	// 방송국 - 내 게시판 글 수정(글)
	@Override
	public int BSmyBoardModify(Board b) {

		int BSmyBoardModify = sqlSession.update("Board.BSmyBoardModify", b);
		
		return BSmyBoardModify;
	}
	
	// 방송국 - 내 게시판 글 수정(사진)
	@Override
	public int BSmyBoardModifyP(BoardFile f) {

		int BSmyBoardModifyP = sqlSession.update("Board.BSmyBoardModifyP", f);
		
		return BSmyBoardModifyP;
	}
	

	@Override
	public int insertReply(ReplyVo re) {
		int result = sqlSession.insert("Board.insertReply", re);
		return result;
	}

	@Override
	public int selectReplyCount(Board b) {
		int count = sqlSession.selectOne("Board.selectReplyCount", b);
		return count;
	}

	@Override
	public ArrayList<ReplyVo> selectReplyList(Board b, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<ReplyVo> list = (ArrayList)sqlSession.selectList("Board.selectReplyList", b, rowBounds);
		return list;
	}

	// 방송국 - 방명록 삭제
	@Override
	public void BSguestDelte(String b_code) {

		sqlSession.update("Board.BSguestDelte", b_code);
	}

	@Override
	public int boardReplyCount(String b_code) {
		return sqlSession.selectOne("Board.boardReplyCount", b_code);
	}
}



