package com.kh.mt.liveBJ.model.service;

import java.util.ArrayList;

import com.kh.mt.JDBC.model.vo.JDBCLogoFile;
import com.kh.mt.board.model.vo.Board;
import com.kh.mt.common.PageInfo;
import com.kh.mt.liveBJ.model.vo.Gudock;
import com.kh.mt.liveBJ.model.vo.LiveBj;
import com.kh.mt.liveBJ.model.vo.Peach;
import com.kh.mt.member.model.vo.BJBlackMember;

public interface LiveBJService {

	void singo(String singoID, String content, String userID);

	String insertBSCotent(LiveBj bj);

	void insertBSTitleImg(JDBCLogoFile f);

	ArrayList<LiveBj> allBJ();

	void startBrod(String roomid,String mid,String bjJCode);

	LiveBj JDBCInfo(String href3);

	LiveBj JDBCInfo2(LiveBj bj1);

	int updatePeach(Peach p);

	int insertSingo(Board b);

	ArrayList insertBJBlackMember(BJBlackMember bm);

	int insertGudock(Gudock gd);

	int updateViewer(LiveBj bj);

	int bangjong(LiveBj bj);

	ArrayList<LiveBj> mainTopBJ();

	ArrayList<LiveBj> scroll(PageInfo pi);

	ArrayList<String> selectFan(String href3);

	int selectCount();



}
