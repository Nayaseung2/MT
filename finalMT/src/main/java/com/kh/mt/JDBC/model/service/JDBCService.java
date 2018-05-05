package com.kh.mt.JDBC.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.mt.JDBC.model.vo.JDBC;
import com.kh.mt.JDBC.model.vo.JDBCInfo;
import com.kh.mt.JDBC.model.vo.JDBCLogoFile;
import com.kh.mt.liveBJ.model.vo.Gudock;

public interface JDBCService {

	//void insertJDBCstation(JDBC j);

	JDBC selectJDBCstation(JDBC j);

	void updateJDBCstation(JDBC j);

	JDBCLogoFile selectJDBCLogo(JDBCLogoFile f);

	void insertJDBCLogoFile(JDBCLogoFile f);

	void updateJDBCLogoFile(JDBCLogoFile f);

	JDBC selectForShow(String mId);

	JDBCLogoFile selectJDBCLogoForShow(String mId);

	HashMap<Integer,ArrayList<JDBCInfo>> selectGudock(String mid);

	String selectNickName(String mid);


}
