package com.kh.mt.BJPayList.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mt.BJPayList.model.vo.BJPayList;
import com.kh.mt.BJPayList.model.vo.Black;
import com.kh.mt.BJPayList.model.vo.Expeach;
import com.kh.mt.BJPayList.model.vo.Subscribe;
import com.kh.mt.common.PageInfo;
import com.kh.mt.member.model.vo.Member;

public interface BJPayListDao {

	int selectPeach(SqlSessionTemplate sqlSession, String mcode);

	int insertBJPayList(SqlSessionTemplate sqlSession, BJPayList bjpvo);

	int selectwdprice(SqlSessionTemplate sqlSession, String mcode);

	ArrayList<BJPayList> selectWithdrawList(SqlSessionTemplate sqlSession, String mcode);

	ArrayList<BJPayList> selectWithdrawAllList(SqlSessionTemplate sqlSession, String mcode, PageInfo pi);

	HashMap<String, String> WithdrawListAllCount(SqlSessionTemplate sqlSession, String mcode);

	HashMap<String, String> ProfitBjAllCount(SqlSessionTemplate sqlSession, String mcode);

	ArrayList<Expeach> selectProfitBjAllList(SqlSessionTemplate sqlSession, String mcode, PageInfo pi);

	ArrayList<Expeach> selectProfitBjList(SqlSessionTemplate sqlSession, String mcode);

	HashMap<String, String> MyFanAllCount(SqlSessionTemplate sqlSession, String mcode);

	ArrayList<Subscribe> selectMyFanAllList(SqlSessionTemplate sqlSession, String mcode, PageInfo pi);

	ArrayList<Subscribe> selectMyFanList(SqlSessionTemplate sqlSession, String mcode);

	HashMap<String, String> BlackListAllCount(SqlSessionTemplate sqlSession, String mcode);

	ArrayList<Black> selectBlackListAllList(SqlSessionTemplate sqlSession, String mcode, PageInfo pi);

	int BlackcancelUpdate(SqlSessionTemplate sqlSession, String mId);

	int updateAccount(SqlSessionTemplate sqlSession, Member m);

	int SelectCountBlack(SqlSessionTemplate sqlSession, String mcode);

	int SelectwdSuccese(SqlSessionTemplate sqlSession, String mcode);

	int Selectwdloding(SqlSessionTemplate sqlSession, String mcode);

	int SelectMyFanCount(SqlSessionTemplate sqlSession, String mcode);

	int SelectProfitPeach(SqlSessionTemplate sqlSession, String mcode);

	String SelectMid(SqlSessionTemplate sqlSession, String mcode);

	int SelectLiveTime(SqlSessionTemplate sqlSession, String mId);

	int SelectAllLiveTime(SqlSessionTemplate sqlSession, String mId);

	int SelectTodayLiveTime(SqlSessionTemplate sqlSession, String mId);

	int SelectLiveTimeYday(SqlSessionTemplate sqlSession, String mId);

	




}
