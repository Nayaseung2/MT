package com.kh.mt.helpcenter.model.sevice;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.kh.mt.helpcenter.model.dao.HelpDao;
import com.kh.mt.helpcenter.model.vo.HelpMainVo;

@Service
public class HelpServiceImpl implements HelpService{
	
	//sdf
	 // 01. 게시글 전체 목록
    public ArrayList<HelpMainVo> listAll() throws Exception {
        
    	ArrayList<HelpMainVo> list = null;
    	
    	
    	return new ArrayList<HelpMainVo>();
    } 
	
}
