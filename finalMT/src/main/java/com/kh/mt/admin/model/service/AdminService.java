package com.kh.mt.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.mt.admin.model.vo.Contact;
import com.kh.mt.admin.model.vo.Revenue;
import com.kh.mt.admin.model.vo.Withdrawal;
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

	//출금신청 유저 리스트카운트 조회
	int searchWithCount(String userId); 
	
	//출금신청 전체 회원 리스트
	HashMap<String, Object> withdrawalList(PageInfo pi);
	
	//출금신청 회원 조회
	ArrayList<Withdrawal> searchWithdrawal(String userId, PageInfo pi);

	int approval(String wdCode);

	HashMap<String, Object> depositList(PageInfo pi);

	ArrayList<Withdrawal> searchDeposit(String userId, PageInfo pi);

	HashMap<String, Object> contactList(PageInfo pi);

	int depositUserCount(String userId); //출금 완료 유저 카운트

	void addAnswer(HashMap<String, String> map); //1:1문의 답변달기

	int contactTypeCount(String type); //문의 타입별 listCount조회용

	HashMap<String, Object> contactTypeList(PageInfo pi, String type); //문의 타입별 리스트 가져오기

	int searchContact(String userId); //문의 유저 카운트

	ArrayList<Contact> searchContactUser(String userId, PageInfo pi); //문의 유저리스트

} 
 