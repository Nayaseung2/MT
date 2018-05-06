package com.kh.mt.BJPayList.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.mt.BJPayList.model.vo.BJPayList;
import com.kh.mt.BJPayList.model.vo.Black;
import com.kh.mt.BJPayList.model.vo.Expeach;
import com.kh.mt.BJPayList.model.vo.Subscribe;
import com.kh.mt.common.PageInfo;
import com.kh.mt.member.model.vo.Member;

public interface BJPayListService {

	int selectPeach(String mcode);

	void insertBJPayList(BJPayList bjpvo);

	int selectwdprice(String mcode);

	ArrayList<BJPayList> selectWithdrawList(String mcode);

	ArrayList<BJPayList> selectWithdrawAllList(String mcode, PageInfo pi);

	HashMap<String, String> WithdrawListAllCount(String mcode);

	HashMap<String, String> ProfitBjAllCount(String mcode);

	ArrayList<Expeach> selectProfitBjAllList(String mcode, PageInfo pi);

	ArrayList<Expeach> selectProfitBjList(String mcode);

	HashMap<String, String> MyFanAllCount(String mcode);

	ArrayList<Subscribe> selectMyFanAllList(String mcode, PageInfo pi);

	ArrayList<Subscribe> selectMyFanList(String mcode);

	HashMap<String, String> BlackListAllCount(String mcode);

	ArrayList<Black> selectBlackListAllList(String mcode, PageInfo pi);

	int BlackcancelUpdate(String mId);

	int updateAccount(Member m);

	int SelectCountBlack(String mcode);

	int SelectwdSuccese(String mcode);

	int Selectwdloding(String mcode);

	int SelectMyFanCount(String mcode);

	int SelectProfitPeach(String mcode);

	String SelectMid(String mcode);

	int SelectLiveTime(String mId);

	int SelectAllLiveTime(String mId);

	int SelectTodayLiveTime(String mId);

	int SelectLiveTimeYday(String mId);




}
