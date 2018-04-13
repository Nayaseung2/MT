package com.kh.mt.helpcenter.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mt.board.model.vo.BoardFile;
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

		//System.out.println("dao's hm : " + hm);
		
		int result = sqlSession.insert("QnA.personal", hm);
		
		return result;
	}

	// 신고하기(제목/내용)
	@Override
	public int report(SqlSessionTemplate sqlSession, HelpMainVo hm) {
		
		//System.out.println("dao's hm : " + hm);
		
		int result1 = sqlSession.insert("QnA.report", hm);
		
		return result1;
	}

	// 신고하기(파일)
	@Override
	public int reportFile(SqlSessionTemplate sqlSession, BoardFile bf) {
		
		//System.out.println("dao's bf : " + bf);
		
		int result2 = sqlSession.insert("Board.reportFile", bf);
		
		return result2;
	}

	// 공지글 목록
	@Override
	public ArrayList<HelpMainVo> nList() {
		
		ArrayList<HelpMainVo> nList = (ArrayList)sqlSession.selectList("QnA.nList");
    	
    	System.out.println("dao's nList : " + nList);
    	
    	return nList;
	}
}
