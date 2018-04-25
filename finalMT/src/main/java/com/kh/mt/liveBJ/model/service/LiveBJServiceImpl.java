package com.kh.mt.liveBJ.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.LiveBeansViewMBean;
import org.springframework.stereotype.Service;

import com.kh.mt.JDBC.model.vo.JDBCLogoFile;
import com.kh.mt.liveBJ.model.dao.LiveBJDao;
import com.kh.mt.liveBJ.model.vo.LiveBj;
@Service
public class LiveBJServiceImpl implements LiveBJService{
	@Autowired
	private LiveBJDao ld;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public void singo(String singoID, String content, String userID) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void insertBSCotent(LiveBj bj) {
		// TODO Auto-generated method stub
		int result=ld.insertBSCotent(sqlSession,bj);
	}


	@Override
	public void insertBSTitleImg(JDBCLogoFile f) {
		// TODO Auto-generated method stub
		int result=ld.insertBSTitleImg(sqlSession,f);
	}


}
