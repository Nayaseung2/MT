package com.kh.mt.JDBC.model.dao;

import com.kh.mt.JDBC.model.vo.JDBC;
import com.kh.mt.JDBC.model.vo.JDBCLogoFile;

public interface JDBCDao {

	int insertJDBCstation(JDBC j);

	JDBC selectJDBCstation(JDBC j);

	int updateJDBCstation(JDBC j);

	JDBCLogoFile selectJDBCLogo(JDBCLogoFile f);

	int insertJDBCLogoFile(JDBCLogoFile f);

	int updateJDBCLogoFile(JDBCLogoFile f);

	JDBC selectForShow(String mId);

	JDBCLogoFile selectJDBCLogoForShow(String mId);



}
