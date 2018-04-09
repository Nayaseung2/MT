package com.kh.mt.admin.model.dao;

import java.util.HashMap;

public interface AdminDao {

	HashMap<String, HashMap<String, String>> allMenuList(); 

	HashMap<String, HashMap<String, String>> memberList();

}
