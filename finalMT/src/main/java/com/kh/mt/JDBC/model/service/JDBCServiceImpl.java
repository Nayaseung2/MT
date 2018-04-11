package com.kh.mt.JDBC.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mt.JDBC.model.dao.JDBCDao;
import com.kh.mt.JDBC.model.vo.JDBC;
import com.kh.mt.member.model.dao.MemberDao;

@Service
public class JDBCServiceImpl implements JDBCService {
	@Autowired
	private JDBCDao jd;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//방송국 정보가 없으면 insert
	@Override
	public void insertJDBCstation(JDBC j) {
		int result=jd.insertJDBCstation(j);
	}

	//방송국 정보가 잇는지 없는지 체크
	@Override
	public JDBC selectJDBCstation(JDBC j) {
		JDBC getJDBCinfo=null;
		getJDBCinfo=jd.selectJDBCstation(j);
		return getJDBCinfo;
	}

	//방송정보가 있으면 업데이트
	@Override
	public void updateJDBCstation(JDBC j) {
		int result=jd.updateJDBCstation(j);
	}

	

}
