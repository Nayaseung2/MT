package com.kh.mt.liveBJ.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mt.JDBC.model.vo.JDBCLogoFile;
import com.kh.mt.board.model.vo.Board;
import com.kh.mt.common.PageInfo;
import com.kh.mt.liveBJ.model.vo.Gudock;
import com.kh.mt.liveBJ.model.vo.LiveBj;
import com.kh.mt.liveBJ.model.vo.Peach;
import com.kh.mt.member.model.vo.BJBlackMember;

public interface LiveBJDao {

	void singo(String singoID, String content, String userID);

	String insertBSCotent(SqlSessionTemplate sqlSession, LiveBj bj);

	int insertBSTitleImg(SqlSessionTemplate sqlSession, JDBCLogoFile f);

	ArrayList<LiveBj> allBJ(SqlSessionTemplate sqlSession);

	int startBrod(SqlSessionTemplate sqlSession, String roomid,String mid, String bjJCode);

	LiveBj JDBCInfo(SqlSessionTemplate sqlSession, String href3);

	LiveBj JDBCInfo2(SqlSessionTemplate sqlSession, LiveBj href3);

	int updatePeach(SqlSessionTemplate sqlSession, Peach p);

	int insertSingo(SqlSessionTemplate sqlSession, Board b);

	int insertBJBlackMember(SqlSessionTemplate sqlSession, BJBlackMember bm);

	int insertGudock(SqlSessionTemplate sqlSession, Gudock gd);

	int updateViewers(SqlSessionTemplate sqlSession, LiveBj bj);

	int bangjong(SqlSessionTemplate sqlSession, LiveBj bj);

	ArrayList<LiveBj> mainTopBJ(SqlSessionTemplate sqlSession);

	ArrayList<LiveBj> scroll(SqlSessionTemplate sqlSession, PageInfo pi);

	ArrayList<String> selectFan(String href3);

	int selectCount();

	ArrayList<BJBlackMember> selectBlackMemberList(BJBlackMember bm);


}
