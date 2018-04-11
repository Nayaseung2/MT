package com.kh.mt.helpcenter.model.sevice;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mt.helpcenter.model.dao.HelpDao;
import com.kh.mt.helpcenter.model.vo.HelpMainVo;

@Service
public class HelpServiceImpl implements HelpService{
	
	@Autowired
	private HelpDao hd;

	// 고객센터 메인화면(=자주묻는 질문)
    public ArrayList<HelpMainVo> listAll(String b_type) throws Exception {
        
    	ArrayList<HelpMainVo> list = null;
    	
    	list = hd.listAll(b_type);
    	
    	return list;
    } 
	
}
