package com.kh.mt.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl implements AdminDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Integer> allMenuList() {
		
		
		 
		
		return null;
	}
	
}
