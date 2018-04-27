package com.kh.mt.liveBJ.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mt.JDBC.model.vo.JDBCLogoFile;
import com.kh.mt.liveBJ.model.vo.LiveBj;

public interface LiveBJDao {

	void singo(String singoID, String content, String userID);

	int insertBSCotent(SqlSessionTemplate sqlSession, LiveBj bj);

	int insertBSTitleImg(SqlSessionTemplate sqlSession, JDBCLogoFile f);

	ArrayList<LiveBj> allBJ(SqlSessionTemplate sqlSession);

	int startBrod(SqlSessionTemplate sqlSession, String roomid,String mid);

	LiveBj JDBCInfo(SqlSessionTemplate sqlSession, String href3);

	LiveBj JDBCInfo2(SqlSessionTemplate sqlSession, String href3);

}
