package com.kh.mt.JDBC.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mt.JDBC.model.vo.JDBC;
import com.kh.mt.JDBC.model.vo.JDBCInfo;
import com.kh.mt.JDBC.model.vo.JDBCLogoFile;
import com.kh.mt.liveBJ.model.vo.Gudock;

public interface JDBCDao {

	int insertJDBCstation(JDBC j);

	JDBC selectJDBCstation(JDBC j);

	int updateJDBCstation(JDBC j);

	JDBCLogoFile selectJDBCLogo(JDBCLogoFile f);

	int insertJDBCLogoFile(JDBCLogoFile f);

	int updateJDBCLogoFile(JDBCLogoFile f);

	JDBC selectForShow(String mId);

	JDBCLogoFile selectJDBCLogoForShow(String mId);

	HashMap<Integer,ArrayList<JDBCInfo>> selectGudock(String mid);

	String selectNickName(String mid);



}
