package com.kh.mt.helpcenter.model.sevice;

import java.util.ArrayList;

import com.kh.mt.helpcenter.model.vo.HelpMainVo;

public interface HelpService {

	 // 01. 게시글 전체 목록
	ArrayList<HelpMainVo> listAll() throws Exception;

}
