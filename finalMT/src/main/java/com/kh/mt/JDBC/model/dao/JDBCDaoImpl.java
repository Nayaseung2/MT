package com.kh.mt.JDBC.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.kh.mt.JDBC.model.vo.JDBC;
import com.kh.mt.JDBC.model.vo.JDBCInfo;
import com.kh.mt.JDBC.model.vo.JDBCLogoFile;
import com.kh.mt.liveBJ.model.vo.Gudock;

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
		//System.out.println("j : "+j);
		return j;
	}

	//방송국 로고 파일 불러오기
	@Override
	public JDBCLogoFile selectJDBCLogoForShow(String mId) {
		JDBCLogoFile f= null;
		f=sqlSession.selectOne("JDBC1.selectJDBCLogoForShow",mId);
		return f;
	}

	@Override
	public HashMap<Integer,ArrayList<JDBCInfo>> selectGudock(String mid) {
		ArrayList<Gudock> gulist = new ArrayList<>(); 
		Gudock gu = new Gudock();
		gu.setReder_mCode(mid);
		gulist = (ArrayList)sqlSession.selectList("JDBC1.selectGudockList", gu);
		System.out.println("gulist: " + gulist);
		HashMap<Integer,ArrayList<JDBCInfo>> hmap = new LinkedHashMap<Integer,ArrayList<JDBCInfo>>();
		
		for(int i =0; i<gulist.size();i++){
			String mId = String.valueOf(gulist.get(i).getBJ_mCode());
			ArrayList<JDBCInfo> list = new ArrayList<>();  
			list = (ArrayList)sqlSession.selectList("JDBC1.selectGudockJDBC", mId);
			hmap.put(i, list);
		};
		return hmap;
	}

	@Override
	public String selectNickName(String mid) {
		String nickName = sqlSession.selectOne("JDBC1.selectNickName", mid);
		return nickName;
	}


}
