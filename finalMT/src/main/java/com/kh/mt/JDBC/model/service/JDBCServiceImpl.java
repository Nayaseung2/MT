package com.kh.mt.JDBC.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mt.JDBC.model.dao.JDBCDao;
import com.kh.mt.JDBC.model.vo.JDBC;
import com.kh.mt.JDBC.model.vo.JDBCInfo;
import com.kh.mt.JDBC.model.vo.JDBCLogoFile;
import com.kh.mt.liveBJ.model.vo.Gudock;
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

	//방송국 로고 유무 체크
	@Override
	public JDBCLogoFile selectJDBCLogo(JDBCLogoFile f) {
		JDBCLogoFile getJDBCLogo=null;
		getJDBCLogo=jd.selectJDBCLogo(f);
		return getJDBCLogo;
	}

	//방송국 로고 파일 insert
	@Override
	public void insertJDBCLogoFile(JDBCLogoFile f) {
		int result = jd.insertJDBCLogoFile(f);
	}

	//방송국 로고파일이 있을 시 로고 파일 업데이트
	@Override
	public void updateJDBCLogoFile(JDBCLogoFile f) {
		int result = jd.updateJDBCLogoFile(f);
	}

	//menubar에서 방송국 가기 눌렀을 때 정보 불러오기
	@Override
	public JDBC selectForShow(String mId) {
		JDBC j =null;
		j=jd.selectForShow(mId);
		return j;
	}

	//JDBC로고 파일 불러오기
	@Override
	public JDBCLogoFile selectJDBCLogoForShow(String mId) {
		JDBCLogoFile f=null;
		f=jd.selectJDBCLogoForShow(mId);
		return f;
	}

	@Override
	public HashMap<Integer,ArrayList<JDBCInfo>> selectGudock(String mid) {
		HashMap<Integer,ArrayList<JDBCInfo>> gu = jd.selectGudock(mid);
		return gu;
	}

	@Override
	public String selectNickName(String mid) {
		String nickName = jd.selectNickName(mid);
		return nickName;
	}



	

}
