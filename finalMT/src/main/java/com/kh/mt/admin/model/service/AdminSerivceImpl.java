package com.kh.mt.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mt.admin.model.dao.AdminDao;
import com.kh.mt.admin.model.vo.Revenue;
import com.kh.mt.common.PageInfo;
import com.kh.mt.member.model.vo.Member;
import com.kh.mt.pay.model.vo.Pay;

@Service
public class AdminSerivceImpl implements AdminService{
	@Autowired
	private AdminDao ad;
	
	@Override
	public HashMap<String, HashMap<String, String>> allMenuList() {
		HashMap<String, HashMap<String, String>> allMenuList = null; 
	
		allMenuList = ad.allMenuList();
		
		
		return allMenuList; 
	}

	@Override
	public HashMap<String, String> memberList() {
		HashMap<String, String> list = null;
		
		list = ad.memberList();
		
		 
		return list;
	}

	@Override
	public ArrayList<Member> userAllList(PageInfo pi) {
		ArrayList<Member> mlist = null;
		
		mlist = ad.userAllList(pi);
		
		
		return mlist;
	}

	@Override
	public int mlistCount() {
		int result = 0;
		
		result = ad.mlistCount();
		
		return result;
	}

	@Override
	public Member searchMember(String search) {
		
		Member m = ad.searchMember(search);
		
		
		return m;
	}

	@Override
	public ArrayList<Member> searchBJ(PageInfo pi) {
		ArrayList<Member> list = ad.searchBJ(pi);
		
		return list;
	}

	@Override
	public String searchDay() {
		
		return ad.searchDay();
	}

	@Override
	public String sysdate() {
		return ad.sysdate();
	}

	@Override
	public String lastDay(String date) {
		
		
		return ad.lastDay(date);
	}

	@Override
	public ArrayList<Pay> payList() {
		ArrayList<Pay> list = ad.payList();
		
		return list;
	}

	@Override
	public ArrayList<Revenue> revenueList(PageInfo pi) {
		ArrayList<Revenue> list = ad.revenueList(pi);
		return list;
	}

	@Override
	public ArrayList<Revenue> searchRevenue(String userId, PageInfo pi) {
		ArrayList<Revenue> list = ad.searchRevenue(userId, pi);
		
		return list;
	}

	@Override
	public int searchRevenueUser(String userId) {
		return ad.searchRevenueUser(userId);
	}

}
