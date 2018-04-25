package com.kh.mt.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mt.admin.model.dao.AdminDao;
import com.kh.mt.admin.model.vo.Contact;
import com.kh.mt.admin.model.vo.Revenue;
import com.kh.mt.admin.model.vo.Withdrawal;
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

	@Override
	public HashMap<String, Object> withdrawalList(PageInfo pi) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<Withdrawal> list = ad.withdrawalList(pi);
		
		if(list != null){
			map.put("wlist", list);
			HashMap<String, String> count = ad.withdrawalCount();
			map.put("wCount", count);
		}
		
		System.out.println(map);
		
		return map;
	}

	@Override
	public ArrayList<Withdrawal> searchWithdrawal(String userId, PageInfo pi) {
		ArrayList<Withdrawal> list =  ad.searchWithdrawal(userId, pi);
		return list;
	}

	@Override
	public int approval(String wdCode) {
		int approval = ad.approval(wdCode);
		
		return approval;
	}

	@Override
	public HashMap<String, Object> depositList(PageInfo pi) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<Withdrawal> dlist = ad.depositList(pi);
		
		map.put("dlist", dlist);
		
		return map;
	}

	@Override
	public ArrayList<Withdrawal> searchDeposit(String userId, PageInfo pi) {
		
		ArrayList<Withdrawal> list =  ad.searchDeposit(userId, pi);
		
		return list;
	}

	@Override
	public HashMap<String, Object> contactList(PageInfo pi) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<Withdrawal> clist = ad.contactList(pi);
		
		map.put("clist", clist);
		
		return map;
	}

	@Override
	public int searchWithCount(String userId) {
		
		return ad.searchWithCount(userId);
	}

	@Override
	public int depositUserCount(String userId) {
		
		return ad.depositUserCount(userId);
	}

	@Override
	public void addAnswer(HashMap<String, String> map) {
		int result = ad.addAnswer(map);
		
		if(result > 0){
			System.out.println("답변 성공");
		}
	}

	@Override
	public int contactTypeCount(String type) {
		return ad.contactTypeCount(type);
	}

	@Override
	public HashMap<String, Object> contactTypeList(PageInfo pi, String type) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<Contact> clist = ad.contactTypeList(pi, type);
		
		map.put("clist", clist);
		
		return map;
	}

	@Override
	public int searchContact(String userId) {
		return ad.searchContact(userId);
	}

	@Override
	public ArrayList<Contact> searchContactUser(String userId, PageInfo pi) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<Contact> clist = ad.searchContactUser(pi, userId);
		
		return clist;
	}

	@Override
	public int stopUser(String userId) {
		return ad.stopUser(userId);
	}

	@Override
	public HashMap<String, Object> blackUsers(PageInfo pi) {
		HashMap<String, Object> list = new HashMap<String, Object>();
		
		ArrayList<Member> mlist = ad.blackUsers(pi);
		list.put("mlist", mlist);
		
		return list;
	}

	@Override
	public int restoreUser(String userId) {
		
		return ad.restoreUser(userId);
	}

	@Override
	public Member blackUserSearch(String userId) {
		Member m = ad.blackUserSearch(userId);
		return m;
	}


}
