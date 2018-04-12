package com.kh.mt.helpcenter.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mt.helpcenter.model.vo.HelpMainVo;

public interface HelpDao {
	
	// 고객센터 메인화면(=자주묻는 질문)
    ArrayList<HelpMainVo> listAll(String b_type) throws Exception;

    // 자주묻는 질문 검색
	ArrayList<HelpMainVo> sList(String word);

	// 1:1 문의글
	int personal(SqlSessionTemplate sqlSession, HelpMainVo hm);
	
}
