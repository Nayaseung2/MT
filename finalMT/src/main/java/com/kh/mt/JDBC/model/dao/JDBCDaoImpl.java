package com.kh.mt.JDBC.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.mt.JDBC.model.vo.JDBC;

@Repository
public class JDBCDaoImpl implements JDBCDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//방송국 정보가 없으면 insert
	@Override
	public int insertJDBCstation(JDBC j) {
		return sqlSession.insert("JDBC1.insertJDBCstation",j);
	}

	//JDBC정보 유무 확인
	@Override
	public JDBC selectJDBCstation(JDBC j) {
		JDBC getInfo= null;
		getInfo=sqlSession.selectOne("JDBC1.selectJDBCstation", j);
		return getInfo;
	}

	//방송국 정보가 있으면 update
	@Override
	public int updateJDBCstation(JDBC j) {
		return sqlSession.update("JDBC1.updateJDBCstation",j);
	}

}
