package com.kh.mt.helpcenter.model.sevice;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mt.helpcenter.model.dao.HelpDao;
import com.kh.mt.helpcenter.model.vo.HelpMainVo;

@Service
public class HelpServiceImpl implements HelpService{
	
	@Autowired
	private HelpDao hd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 고객센터 메인화면(=자주묻는 질문)
	@Override
    public ArrayList<HelpMainVo> listAll(String b_type) throws Exception {
        
    	ArrayList<HelpMainVo> list = null;
    	
    	list = hd.listAll(b_type);
    	
    	return list;
    }

    // 자주묻는 질문 검색
	@Override
	public ArrayList<HelpMainVo> sList(String word) {

		ArrayList<HelpMainVo> sList = null;
		
		sList = hd.sList(word);
		
		return sList;
	}

	// 1:1 문의글
	@Override
	public void personal(HelpMainVo hm) {

		int result = hd.personal(sqlSession, hm);
		
	} 
	
}
