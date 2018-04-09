package com.kh.mt.helpcenter.model.dao;

import java.util.ArrayList;

import com.kh.mt.helpcenter.model.vo.HelpMainVo;

public interface HelpDao {
	
//sdf
	// 01. 게시글 전체 목록
    public ArrayList<HelpMainVo> listAll() throws Exception;
	
}
