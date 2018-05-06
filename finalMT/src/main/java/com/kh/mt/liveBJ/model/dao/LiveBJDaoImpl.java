package com.kh.mt.liveBJ.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mt.JDBC.model.vo.JDBCLogoFile;
import com.kh.mt.board.model.vo.Board;
import com.kh.mt.liveBJ.model.vo.Gudock;
import com.kh.mt.liveBJ.model.vo.LiveBj;
import com.kh.mt.liveBJ.model.vo.Peach;
import com.kh.mt.member.model.vo.BJBlackMember;

@Repository
public class LiveBJDaoImpl implements LiveBJDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public void singo(String singoID, String content, String userID) {
		
	}
	@Override
	public String insertBSCotent(SqlSessionTemplate sqlSession, LiveBj bj) {
		int result = sqlSession.insert("LiveBJ.insertBSCotent",bj);
		String bjJcode = "";
		if(result == 1){
			bjJcode = sqlSession.selectOne("LiveBJ.selectBjJcode", bj);
		}
		return bjJcode;
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
	public int startBrod(SqlSessionTemplate sqlSession, String roomid,String mid, String bjJCode) {
		String roomid2 = roomid;
		/*"https://localhost:8034/mt/testLiveBj.lb#"*/
		LiveBj bj = new LiveBj();
		bj.setV_href(roomid2);
		bj.setMid(mid);
		bj.setJcode(bjJCode);
		int result = sqlSession.update("LiveBJ.startBrod", bj);
		return result;
	}
	@Override
	public LiveBj JDBCInfo(SqlSessionTemplate sqlSession, String href3) {
		LiveBj bj = sqlSession.selectOne("LiveBJ.JDBCInfo", href3);
		return bj;
	}
	@Override
	public LiveBj JDBCInfo2(SqlSessionTemplate sqlSession, LiveBj href3) {
		LiveBj bj = sqlSession.selectOne("LiveBJ.JDBCInfo2", href3);
		return bj;
	}
	@Override
	public int updatePeach(SqlSessionTemplate sqlSession, Peach p) {
		int result = sqlSession.update("Member.updatePeach", p);
		result = sqlSession.insert("Peach.insertExPeach",p);
		
		p.setUserId(p.getBjId());
		result = sqlSession.update("Member.updatePeachUp", p);
		return result;
	}
	@Override
	public int insertSingo(SqlSessionTemplate sqlSession, Board b) {
		int result = sqlSession.insert("QnA.singoInsert", b);
		return result;
	}
	@Override
	public ArrayList insertBJBlackMember(SqlSessionTemplate sqlSession, BJBlackMember bm) {
		int result = sqlSession.insert("BJBlackMember.blackMemberInsert",bm);
		ArrayList bmArr = new ArrayList();
		if(result == 1){
			bmArr = (ArrayList) sqlSession.selectList("BJBlackMember.selectBlackMembers", bm);
		}
		return bmArr;
	}
	@Override
	public int insertGudock(SqlSessionTemplate sqlSession, Gudock gd) {
		int result = sqlSession.selectOne("Gudock.selectGudock",gd);
		if(result == 0){
			result = sqlSession.insert("Gudock.insertGudock",gd);
		}else if(result != 0){
			result = sqlSession.delete("Gudock.deleteGudock",gd);
		};
		return result;
	}
	@Override
	public int updateViewers(SqlSessionTemplate sqlSession, LiveBj bj) {
		int result = sqlSession.update("LiveBJ.insertViewer", bj);
		int viewers = 0;
		if(result == 1){
			viewers = sqlSession.selectOne("LiveBJ.selectViewers",bj);
		}
		return viewers;
	}
	@Override
	public int bangjong(SqlSessionTemplate sqlSession, LiveBj bj) {
		int result = sqlSession.update("LiveBJ.bangjong", bj);
		return result;
	}
	@Override
	public ArrayList<LiveBj> mainTopBJ(SqlSessionTemplate sqlSession) {
		ArrayList<LiveBj> list = (ArrayList)sqlSession.selectList("LiveBJ.mainTopBJ");
		return list;
	}
	@Override
	public ArrayList<LiveBj> scroll(SqlSessionTemplate sqlSession) {
		ArrayList<LiveBj> list = (ArrayList)sqlSession.selectList("LiveBJ.scroll");
		return list;
	}
	@Override
	public ArrayList<String> selectFan(String href3) {
		String mId = href3;
		ArrayList<String> list1 = (ArrayList)sqlSession.selectList("LiveBJ.selectFan", mId);
		ArrayList<String> list = new ArrayList<>();
		for(int i = 0; i < list1.size() ;i++){
			mId = list1.get(i);
			list.add(sqlSession.selectOne("LiveBJ.selectFanid", mId));
		}
		return list;
	}
	
}
