package com.kh.mt.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.mt.admin.model.dao.AdminDao;

@Service
public class AdminSerivceImpl implements AdminService{
	@Autowired
	private AdminDao ad;
	@Override
	public ArrayList<Integer> allMenuList() {
		ArrayList<Integer> allMenuList = null;
	
		allMenuList = ad.allMenuList();
		
		return allMenuList;
	}

}
