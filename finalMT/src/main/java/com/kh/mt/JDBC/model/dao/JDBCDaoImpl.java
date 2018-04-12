package com.kh.mt.JDBC.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.mt.JDBC.model.vo.JDBC;
import com.kh.mt.JDBC.model.vo.JDBCLogoFile;

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

	//방송국 로고 유무 체크
	@Override
	public JDBCLogoFile selectJDBCLogo(JDBCLogoFile f) {
		JDBCLogoFile getJDBCLogo=null;
		getJDBCLogo=sqlSession.selectOne("JDBC1.selectJDBCLogo",f);
		return getJDBCLogo;
	}

	//방송국 로고 파일 insert
	@Override
	public int insertJDBCLogoFile(JDBCLogoFile f) {
		return sqlSession.insert("JDBC1.insertJDBCLogo",f);
	}

	//방송국 로고파일이 있을 시 로고 파일 업데이트
	@Override
	public int updateJDBCLogoFile(JDBCLogoFile f) {
		return sqlSession.update("JDBC1.updateJDBCLogo",f);
	}
	//menubar에서 방송국 가기 눌렀을 때 정보 불러오기
	@Override
	public JDBC selectForShow(String mId) {
		JDBC j = null;
		j=sqlSession.selectOne("JDBC1.selectForShow",mId);
		System.out.println("j : "+j);
		return j;
	}


}
