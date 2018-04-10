package com.kh.mt.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.mt.member.model.vo.Member;

public interface AdminService {

	HashMap<String, HashMap<String, String>> allMenuList();

	HashMap<String, HashMap<String, String>> memberList();

	ArrayList<Member> userAllList(); 
} 
 