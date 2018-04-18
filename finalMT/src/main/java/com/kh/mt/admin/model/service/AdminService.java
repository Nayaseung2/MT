package com.kh.mt.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.mt.admin.model.vo.Revenue;
import com.kh.mt.common.PageInfo;
import com.kh.mt.member.model.vo.Member;
import com.kh.mt.pay.model.vo.Pay;

public interface AdminService {

	HashMap<String, HashMap<String, String>> allMenuList();

	HashMap<String, String> memberList();

	ArrayList<Member> userAllList(PageInfo pi);

	int mlistCount();

	Member searchMember(String search);

	ArrayList<Member> searchBJ(PageInfo pi);

	String searchDay();

	//오늘날짜
	String sysdate();
	
	//마지막일 추출
	String lastDay(String date);
	
	//수익관리 전체 회원 리스트
	ArrayList<Pay> payList();

	//수익관리 전체 회원 리스트
	ArrayList<Revenue> revenueList(PageInfo pi);
	
	//수익관리 회원조회
	ArrayList<Revenue> searchRevenue(String userId, PageInfo pi);
	
	//유저 리스트카운트 조회
	int searchRevenueUser(String userId); 
} 
 