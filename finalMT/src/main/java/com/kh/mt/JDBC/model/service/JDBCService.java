package com.kh.mt.JDBC.model.service;

import com.kh.mt.JDBC.model.vo.JDBC;
import com.kh.mt.JDBC.model.vo.JDBCLogoFile;

public interface JDBCService {
  
	void insertJDBCstation(JDBC j);

	JDBC selectJDBCstation(JDBC j);

	void updateJDBCstation(JDBC j);

	JDBCLogoFile selectJDBCLogo(JDBCLogoFile f);

	void insertJDBCLogoFile(JDBCLogoFile f);

	void updateJDBCLogoFile(JDBCLogoFile f);

	JDBC selectForShow(String mId);

}
