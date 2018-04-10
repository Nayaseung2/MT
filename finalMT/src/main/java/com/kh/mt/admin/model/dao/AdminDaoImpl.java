package com.kh.mt.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mt.common.PageInfo;
import com.kh.mt.member.model.vo.Member;

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

	@Override
	public ArrayList<Member> userAllList(PageInfo pi) {
		ArrayList<Member> mlist = null; 
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		mlist = (ArrayList) sqlSession.selectList("Member.userAllList", null, rowBounds);
		
		
		return mlist;
	}

	@Override
	public int mlistCount() {
		int result = 0;

		result = sqlSession.selectOne("Member.memberListCount");
		
		return result;
	}
	
}
