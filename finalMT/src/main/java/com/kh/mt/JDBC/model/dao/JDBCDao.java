package com.kh.mt.JDBC.model.dao;

import com.kh.mt.JDBC.model.vo.JDBC;

public interface JDBCDao {

	int insertJDBCstation(JDBC j);

	JDBC selectJDBCstation(JDBC j);

	int updateJDBCstation(JDBC j);

}
