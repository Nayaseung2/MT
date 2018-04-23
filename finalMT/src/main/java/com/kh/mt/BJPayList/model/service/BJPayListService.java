package com.kh.mt.BJPayList.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.mt.BJPayList.model.vo.BJPayList;
import com.kh.mt.BJPayList.model.vo.Expeach;
import com.kh.mt.BJPayList.model.vo.Subscribe;
import com.kh.mt.common.PageInfo;

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



}
