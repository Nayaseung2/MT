package com.kh.mt.helpcenter.model.dao;

import java.util.ArrayList;

import com.kh.mt.helpcenter.model.vo.HelpMainVo;

public interface HelpDao {
	
	// 고객센터 메인화면(=자주묻는 질문)
    ArrayList<HelpMainVo> listAll(String b_type) throws Exception;
	
}
