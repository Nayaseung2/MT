package com.kh.mt.liveBJ.model.service;

import com.kh.mt.JDBC.model.vo.JDBCLogoFile;
import com.kh.mt.liveBJ.model.vo.LiveBj;

public interface LiveBJService {

	void singo(String singoID, String content, String userID);

	void insertBSCotent(LiveBj bj);

	void insertBSTitleImg(JDBCLogoFile f);



}
