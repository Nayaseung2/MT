package com.kh.mt.admin.model.service;

import java.util.HashMap;

public interface AdminService {

	HashMap<String, HashMap<String, String>> allMenuList();

	HashMap<String, HashMap<String, String>> memberList(); 
} 
