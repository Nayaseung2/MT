package com.kh.mt.liveBJ.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.LiveBeansViewMBean;
import org.springframework.stereotype.Service;

import com.kh.mt.JDBC.model.vo.JDBCLogoFile;
import com.kh.mt.board.model.vo.Board;
import com.kh.mt.common.PageInfo;
import com.kh.mt.liveBJ.model.dao.LiveBJDao;
import com.kh.mt.liveBJ.model.vo.Gudock;
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
	public String insertBSCotent(LiveBj bj) {
		// TODO Auto-generated method stub
		String bjJcode = ld.insertBSCotent(sqlSession,bj);
		
		return bjJcode;
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
	public void startBrod(String roomid,String mid,String bjJCode) {
		int result = ld.startBrod(sqlSession,roomid,mid,bjJCode);
		
	}


	@Override
	public LiveBj JDBCInfo(String href3) {
		LiveBj bj = ld.JDBCInfo(sqlSession,href3);
		return bj;
	}


	@Override
	public LiveBj JDBCInfo2(LiveBj href3) {
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
	public int insertBJBlackMember(BJBlackMember bm) {
		
		int result = ld.insertBJBlackMember(sqlSession, bm); 
		return result;
	}


	@Override
	public int insertGudock(Gudock gd) {
		int result = ld.insertGudock(sqlSession, gd);
		return result;
	}


	@Override
	public int updateViewer(LiveBj bj) {
		int viewers = ld.updateViewers(sqlSession, bj);
		return viewers;
	}


	@Override
	public int bangjong(LiveBj bj) {
		int result = ld.bangjong(sqlSession, bj);
		return result;
	}


	@Override
	public ArrayList<LiveBj> mainTopBJ() {
		ArrayList<LiveBj> list = ld.mainTopBJ(sqlSession);
		return list;
	}


	@Override
	public ArrayList<LiveBj> scroll(PageInfo pi) {
		ArrayList<LiveBj> list = ld.scroll(sqlSession, pi);
		return list;
	}


	@Override
	public ArrayList<String> selectFan(String href3) {
		ArrayList<String> arr =  ld.selectFan(href3) ;
		return arr;
	}


	@Override
	public int selectCount() {
		int count = ld.selectCount();
		return count;
	}


	@Override
	public ArrayList<BJBlackMember> selectBlackMemberList(BJBlackMember bm) {
		ArrayList<BJBlackMember> list = ld.selectBlackMemberList(bm); 
		return list;
	}




}
