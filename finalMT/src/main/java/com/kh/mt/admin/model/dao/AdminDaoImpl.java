package com.kh.mt.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mt.admin.model.vo.Revenue;
import com.kh.mt.common.PageInfo;
import com.kh.mt.member.model.vo.Member;
import com.kh.mt.pay.model.vo.Pay;

@Repository
public class AdminDaoImpl implements AdminDao{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public HashMap<String, HashMap<String, String>> allMenuList() {
		HashMap<String, HashMap<String, String>> list = new HashMap<String, HashMap<String, String>>(); 
		
		list.put("allList",sqlSession.selectOne("Admin.allMenuList"));
		
		return list;
	} 

	@Override
	public HashMap<String, String> memberList() {
		HashMap<String, String> list = sqlSession.selectOne("Admin.memberList");
	
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

	@Override
	public Member searchMember(String search) {
		
		Member m = sqlSession.selectOne("Member.loginCheck", search);
		
		return m;
	}
	
	
	@Override
	public ArrayList<Member> searchBJ(PageInfo pi) {

		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		ArrayList<Member> list = (ArrayList)sqlSession.selectList("Member.BJList", null, rowBounds);
		
		return list;
	}

	@Override
	public String searchDay() {
		return sqlSession.selectOne("Admin.searchDay");
	}

	@Override
	public String sysdate() {
		return sqlSession.selectOne("Admin.sysdate");
	}

	@Override
	public String lastDay(String date) {
		
		return sqlSession.selectOne("Admin.lastDay", date);
	}

	
	//결제정보 리스트
	@Override
	public ArrayList<Pay> payList() {
		ArrayList<Pay> list = (ArrayList) sqlSession.selectList("Pay.payList");
		
		return list;
	}

	//[수익]회원 리스트
	@Override
	public ArrayList<Revenue> revenueList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		ArrayList<Revenue> list = (ArrayList)sqlSession.selectList("Admin.revenueList", null, rowBounds);
		
		return list;
	}
	
	
}
