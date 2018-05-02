package com.kh.mt.liveBJ.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.LiveBeansViewMBean;
import org.springframework.stereotype.Service;

import com.kh.mt.JDBC.model.vo.JDBCLogoFile;
import com.kh.mt.board.model.vo.Board;
import com.kh.mt.liveBJ.model.dao.LiveBJDao;
import com.kh.mt.liveBJ.model.vo.LiveBj;
import com.kh.mt.liveBJ.model.vo.Peach;
import com.kh.mt.member.model.vo.BJBlackMember;
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


	@Override
	public ArrayList<LiveBj> allBJ() {
		ArrayList<LiveBj> list = ld.allBJ(sqlSession);
		return list;
	}


	@Override
	public void startBrod(String roomid,String mid) {
		int result = ld.startBrod(sqlSession,roomid,mid);
		
	}


	@Override
	public LiveBj JDBCInfo(String href3) {
		LiveBj bj = ld.JDBCInfo(sqlSession,href3);
		return bj;
	}


	@Override
	public LiveBj JDBCInfo2(String href3) {
		LiveBj bj = ld.JDBCInfo2(sqlSession,href3);
		return bj;
	}


	@Override
	public int updatePeach(Peach p) {
		int result = ld.updatePeach(sqlSession, p);
		return result;
	}


	@Override
	public int insertSingo(Board b) {
		int result = ld.insertSingo(sqlSession, b);
		return result;
	}


	@Override
	public ArrayList insertBJBlackMember(BJBlackMember bm) {
		
		ArrayList bmArr = ld.insertBJBlackMember(sqlSession, bm); 
		return bmArr;
	}


}
