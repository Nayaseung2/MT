package com.kh.mt.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mt.admin.model.dao.AdminDao;

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
	public HashMap<String, HashMap<String, String>> memberList() {
		HashMap<String, HashMap<String, String>> list = null;
		
		list = ad.memberList();
		
		return list;
	}

}
