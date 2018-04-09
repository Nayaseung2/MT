package com.kh.mt.admin.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl implements AdminDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public HashMap<String, HashMap<String, String>> allMenuList() {
		HashMap<String, HashMap<String, String>> list = new HashMap<String, HashMap<String, String>>(); 
		
		list.put("allList",sqlSession.selectOne("Admin.allMenuList"));
		
		
		System.out.println("dao list확인: " + list);
		
		return list;
	} 

	@Override
	public HashMap<String, HashMap<String, String>> memberList() {
		HashMap<String, HashMap<String, String>> list = new HashMap<String, HashMap<String, String>>();
		
		list.put("list", sqlSession.selectOne("Admin.memberList"));
		
		System.out.println("dao memberListL "+list);
		
		return list;
	}
	
}
