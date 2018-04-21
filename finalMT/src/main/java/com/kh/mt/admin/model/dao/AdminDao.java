package com.kh.mt.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.mt.admin.model.vo.Revenue;
import com.kh.mt.admin.model.vo.Withdrawal;
import com.kh.mt.common.PageInfo;
import com.kh.mt.member.model.vo.Member;
import com.kh.mt.pay.model.vo.Pay;

public interface AdminDao {

	HashMap<String, HashMap<String, String>> allMenuList(); 

	HashMap<String, String> memberList();

	ArrayList<Member> userAllList(PageInfo pi);

	int mlistCount();

	Member searchMember(String search);

	ArrayList<Member> searchBJ(PageInfo pi);

	String searchDay();

	String sysdate();

	String lastDay(String date);

	ArrayList<Pay> payList();

	ArrayList<Revenue> revenueList(PageInfo pi);

	ArrayList<Revenue> searchRevenue(String userId, PageInfo pi);

	int searchRevenueUser(String userId);

	ArrayList<Withdrawal> withdrawalList(PageInfo pi);

	HashMap<String, String> withdrawalCount();

	ArrayList<Withdrawal> searchWithdrawal(String userId, PageInfo pi);

	int approval(String wdCode);

	ArrayList<Withdrawal> depositList(PageInfo pi);

	ArrayList<Withdrawal> searchDeposit(String userId, PageInfo pi);

	ArrayList<Withdrawal> contactList(PageInfo pi);

	int searchWithCount(String userId);

	int depositUserCount(String userId);

}
