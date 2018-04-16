package com.kh.mt.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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

	String sysdate();

	String lastDay(String date);

	ArrayList<Pay> payList(); 
} 
 