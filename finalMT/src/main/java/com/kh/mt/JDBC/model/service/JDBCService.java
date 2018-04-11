package com.kh.mt.JDBC.model.service;

import com.kh.mt.JDBC.model.vo.JDBC;

public interface JDBCService {

	void insertJDBCstation(JDBC j);

	JDBC selectJDBCstation(JDBC j);

	void updateJDBCstation(JDBC j);


}
