package com.kh.mt.BJPayList.model.service;

import java.util.ArrayList;

import com.kh.mt.BJPayList.model.vo.BJPayList;

public interface BJPayListService {

	int selectPeach(String mcode);

	void insertBJPayList(BJPayList bjpvo);

	int selectwdprice(String mcode);

	ArrayList<BJPayList> selectWithdrawList(String mcode);


}
