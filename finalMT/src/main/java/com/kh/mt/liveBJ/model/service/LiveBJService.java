package com.kh.mt.liveBJ.model.service;

import java.util.ArrayList;

import com.kh.mt.JDBC.model.vo.JDBCLogoFile;
import com.kh.mt.liveBJ.model.vo.LiveBj;

public interface LiveBJService {

	void singo(String singoID, String content, String userID);

	void insertBSCotent(LiveBj bj);

	void insertBSTitleImg(JDBCLogoFile f);

	ArrayList<LiveBj> allBJ();

	void startBrod(String roomid,String mid);

	LiveBj JDBCInfo(String href3);

	LiveBj JDBCInfo2(String href3);



}
