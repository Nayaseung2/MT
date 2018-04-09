package com.kh.mt.helpcenter.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mt.helpcenter.model.vo.HelpMainVo;

@Repository
public class HelpDaoImpl implements HelpDao{
	@Autowired
	private SqlSession session;
	// 자주묻는 게시판 불러오기
	/*public List<HelpMainVo> selectHelpMain(SqlSessionTemplate sqlSession, HelpMainVo hm) {
		return sqlSession.selectList("QnA.selectList");
	}*/
	
	// 01. 게시글 전체 목록
    public ArrayList<HelpMainVo> listAll() throws Exception {
    	ArrayList<HelpMainVo> list = null; 
    	list = session.selectList("QnA.listAll");
    	
    	return null;
    }
}
