package com.kh.mt.liveBJ.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mt.JDBC.model.vo.JDBCLogoFile;
import com.kh.mt.liveBJ.model.vo.LiveBj;

@Repository
public class LiveBJDaoImpl implements LiveBJDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public void singo(String singoID, String content, String userID) {
		
	}
	@Override
	public int insertBSCotent(SqlSessionTemplate sqlSession, LiveBj bj) {
		int result = sqlSession.insert("LiveBJ.insertBSCotent",bj);
		
		return result;
	}
	@Override
	public int insertBSTitleImg(SqlSessionTemplate sqlSession, JDBCLogoFile f) {
		int result = sqlSession.insert("LiveBJ.insertBSTitleImg", f);
		
		return result;
	}
	@Override
	public ArrayList<LiveBj> allBJ(SqlSessionTemplate sqlSession) {
		ArrayList<LiveBj> list = (ArrayList)sqlSession.selectList("LiveBJ.allBJ");
		
		return list;
	}
	@Override
	public int startBrod(SqlSessionTemplate sqlSession, String roomid,String mid) {
		String roomid2 = roomid;
		/*"https://localhost:8034/mt/testLiveBj.lb#"*/
		LiveBj bj = new LiveBj();
		bj.setV_href(roomid2);
		bj.setMid(mid);
		
		int result = sqlSession.update("LiveBJ.startBrod", bj);
		System.out.println(result+"ㄱㄹㄹ");
		return result;
	}
	@Override
	public LiveBj JDBCInfo(SqlSessionTemplate sqlSession, String href3) {
		System.out.println(href3);
		LiveBj bj = sqlSession.selectOne("LiveBJ.JDBCInfo", href3);
		System.out.println("방정보 : "+bj);
		return bj;
	}
	@Override
	public LiveBj JDBCInfo2(SqlSessionTemplate sqlSession, String href3) {
		System.out.println(href3);
		LiveBj bj = sqlSession.selectOne("LiveBJ.JDBCInfo2", href3);
		System.out.println("방정보 : "+bj);
		return bj;
	}

}
