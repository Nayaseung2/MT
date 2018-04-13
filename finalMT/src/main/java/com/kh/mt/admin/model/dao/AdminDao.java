package com.kh.mt.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.mt.common.PageInfo;
import com.kh.mt.member.model.vo.Member;

public interface AdminDao {

	HashMap<String, HashMap<String, String>> allMenuList(); 

	HashMap<String, String> memberList();

	ArrayList<Member> userAllList(PageInfo pi);

	int mlistCount();

	Member searchMember(String search);

	ArrayList<Member> searchBJ(PageInfo pi);

	
}
