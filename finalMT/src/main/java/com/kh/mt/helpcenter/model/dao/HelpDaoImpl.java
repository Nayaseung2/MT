package com.kh.mt.helpcenter.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mt.board.model.vo.Board;
import com.kh.mt.board.model.vo.BoardFile;
import com.kh.mt.common.PageInfo;
import com.kh.mt.helpcenter.model.vo.HelpMainVo;
//sdfsdfs
@Repository
public class HelpDaoImpl implements HelpDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 고객센터 메인화면(=자주묻는 질문)
	@Override
    public ArrayList<HelpMainVo> listAll(String b_type) throws Exception {
    	
    	ArrayList<HelpMainVo> list = (ArrayList)sqlSession.selectList("QnA.listAll", b_type);
    	
    	//System.out.println("dao's listAll : " + list);
    	
    	return list;
    }

	// 자주묻는 질문 검색
	@Override
	public ArrayList<HelpMainVo> sList(String word) {

		ArrayList<HelpMainVo> sList = (ArrayList)sqlSession.selectList("QnA.sList", word);
		
		//System.out.println("dao's sList : " + sList);
		
		return sList;
	}

	// 1:1 문의글
	@Override
	public int personal(SqlSessionTemplate sqlSession, HelpMainVo hm) {

		int result = sqlSession.insert("QnA.personal", hm);
		
		//System.out.println("dao's hm : " + hm);
		
		return result;
	}
	
	// 신고대상 아이디 체크
	@Override
	public String bullyIdCheck(String bullyId) {

		String userId="";
		
		userId = sqlSession.selectOne("QnA.bullyIdCheck", bullyId);
		
		return userId;
	}

	// 신고하기(신고대상 아이디/내용)
	@Override
	public int report(SqlSessionTemplate sqlSession, HelpMainVo hm) {
		
		int result1 = sqlSession.insert("QnA.report", hm);
		
		//System.out.println("dao's hm : " + hm);
		
		return result1;
	}

	// 신고하기(파일)
	@Override
	public int reportFile(SqlSessionTemplate sqlSession, BoardFile bf) {
		
		int result2 = sqlSession.insert("Board.reportFile", bf);
		
		//System.out.println("dao's bf : " + bf);
		
		return result2;
	}

	// 공지글 목록
	@Override
	public ArrayList<HelpMainVo> nList(PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		ArrayList<HelpMainVo> nList = (ArrayList)sqlSession.selectList("QnA.nList", null, rowBounds);
		
    	//System.out.println("dao's nList : " + nList);
    	
    	return nList;
	}

	// 공지글 상세보기
	@Override
	public ArrayList<HelpMainVo> nListDetail(String b_code) {

		ArrayList<HelpMainVo> nListDetail = (ArrayList)sqlSession.selectList("QnA.nListDetail", b_code);
    	
    	//System.out.println("dao's nListDetail : " + nListDetail);
    	
    	return nListDetail;
	}

	// 총 공지글 수
	@Override
	public int nListTotal() {

		int nListTotal = sqlSession.selectOne("QnA.nListTotal");
		
		//System.out.println("dao's nListTotal : " + nListTotal);
		
		return nListTotal;
	}

	// 게시글 조회수 올리기
	@Override
	public int updateCount(String b_code) {

		int result = sqlSession.update("QnA.updateCount", b_code);
		
		//System.out.println("dao's result : " + result);
		
		return result;
	}

	// 공지글 쓰기
	@Override
	public int helpnoticeWrite(Board b) {

		int helpnoticeWrite = sqlSession.update("QnA.helpnoticeWrite", b);
		
		return helpnoticeWrite;
	}

	// 공지글 수정하기
	@Override
	public void helpnoticeModify(Board b) {

		sqlSession.update("QnA.helpnoticeModify", b);
	}

	// 공지글 삭제하기
	@Override
	public void goDeleteNotice(String b_code) {

		sqlSession.update("QnA.goDeleteNotice", b_code);
	}

}
