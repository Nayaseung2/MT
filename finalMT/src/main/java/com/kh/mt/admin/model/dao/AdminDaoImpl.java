package com.kh.mt.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mt.admin.model.vo.Contact;
import com.kh.mt.admin.model.vo.Report;
import com.kh.mt.admin.model.vo.Revenue;
import com.kh.mt.admin.model.vo.Withdrawal;
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
		
		System.out.println(list);
		
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
		
		mlist = (ArrayList) sqlSession.selectList("Admin.userAllList", null, rowBounds);
		
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
	
	//[수익]회원 조회
	@Override
	public ArrayList<Revenue> searchRevenue(String userId, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		ArrayList<Revenue> list = (ArrayList)sqlSession.selectList("Admin.searchRevenue", userId, rowBounds);

		return list;
	}
	
	//유저 리스트카운트 조회
	@Override
	public int searchRevenueUser(String userId) {
		return sqlSession.selectOne("Admin.searchRevenueUser", userId);
	}
	
	
	
	@Override
	public ArrayList<Withdrawal> withdrawalList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		ArrayList<Withdrawal> list = (ArrayList)sqlSession.selectList("Admin.withdrawalList", null, rowBounds);
		
		return list;
		
	}

	@Override
	public HashMap<String, String> withdrawalCount() {
		
		HashMap<String, String> map = sqlSession.selectOne("Admin.withdrawalCount");
		
		return map;
	}

	@Override
	public ArrayList<Withdrawal> searchWithdrawal(String userId, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		ArrayList<Withdrawal> list =  (ArrayList)sqlSession.selectList("Admin.searchWithdrawal", userId, rowBounds);
		
		return list;
	}

	@Override
	public int approval(String wdCode) {
		int approval = sqlSession.update("Admin.approval", Integer.parseInt(wdCode));
		return approval;
	}

	@Override
	public ArrayList<Withdrawal> depositList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		ArrayList<Withdrawal> list = (ArrayList)sqlSession.selectList("Admin.depositList", null, rowBounds);
		
		return list;
	}

	@Override
	public ArrayList<Withdrawal> searchDeposit(String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		ArrayList<Withdrawal> list =  (ArrayList)sqlSession.selectList("Admin.searchDeposit", userId, rowBounds);
		
		return list;
	}

	@Override
	public ArrayList<Withdrawal> contactList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		ArrayList<Withdrawal> list = (ArrayList)sqlSession.selectList("Admin.contactList", null, rowBounds);
		
		return list;
	}

	@Override
	public int searchWithCount(String userId) {
		return sqlSession.selectOne("Admin.searchWithCount", userId);
	}

	@Override
	public int depositUserCount(String userId) {
		return sqlSession.selectOne("Admin.depositUserCount", userId);
	}

	@Override
	public int addAnswer(HashMap<String, String> map) {
		
		int result = sqlSession.insert("Admin.addAnswer", map);
		
		return result;
	}

	@Override
	public int contactTypeCount(String type) {
		return sqlSession.selectOne("Admin.contactTypeCount", type);
	}

	@Override
	public ArrayList<Contact> contactTypeList(PageInfo pi, String type) {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		ArrayList<Contact> list = (ArrayList)sqlSession.selectList("Admin.contactTypeList", type, rowBounds);
		
		return list;
	}

	@Override
	public int searchContact(String userId) {
		return sqlSession.selectOne("Admin.searchContact", userId);
	}

	@Override
	public ArrayList<Contact> searchContactUser(PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		ArrayList<Contact> list = (ArrayList)sqlSession.selectList("Admin.searchContactUser", userId, rowBounds);
		
		return list;
	}

	@Override
	public int stopUser(String userId) {
		return sqlSession.update("Admin.stopUser", userId);
	}

	@Override
	public ArrayList<Member> blackUsers(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		ArrayList<Member> list = (ArrayList)sqlSession.selectList("Admin.blackUsers", null, rowBounds);
		
		return list;
	}

	@Override
	public int restoreUser(String userId) {
		return sqlSession.update("Admin.restoreUser", userId);
	}

	@Override
	public Member blackUserSearch(String userId) {
		Member m = sqlSession.selectOne("Admin.blackUserSearch", userId);
		return m;
	}

	@Override
	public int reportListCount() {
		int result = sqlSession.selectOne("Admin.reportListCount");
		return result;
	}

	@Override
	public ArrayList<Report> reportList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("Admin.reportList", null, rowBounds);
	}

	@Override
	public String urlSearch(String target) {
		
		return sqlSession.selectOne("Admin.urlSearch", target);
	}

	@Override
	public int newUserCount() {
		return sqlSession.selectOne("Admin.newUserCount");
	}

	@Override
	public ArrayList<Member> newUserList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("Admin.newUserList", null, rowBounds);
	}

	@Override
	public int reportUserCount(String userId) {
		
		return sqlSession.selectOne("Admin.reportUserCount", userId);
	}

	@Override
	public ArrayList<Report> searchReportUser(String userId, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<Report> list = (ArrayList)sqlSession.selectList("Admin.searchReportUser", userId, rowBounds);
		
		System.out.println("AdminDoaImpl searchReportUser list: " + list);
		return list;
	}

	@Override
	public int sReportListCount() {
		return sqlSession.selectOne("Admin.sReportListCount");
	}

	@Override
	public ArrayList<Report> sReportList(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList)sqlSession.selectList("Admin.sReportList", null, rowBounds);
	}

	@Override
	public int statusChange(String bCode) {
		return sqlSession.update("Admin.statusChange", bCode);
	}

	@Override
	public int sReportUserSearch(String userId) {
		return sqlSession.selectOne("Admin.sReportUserSearch", userId);
	}

	@Override
	public ArrayList<Report> sReportUserList(PageInfo pi, String userId) {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return (ArrayList) sqlSession.selectList("Admin.sReportUserList", userId, rowBounds);
	}

	@Override
	public int refusal(String wdCode) {
		return sqlSession.update("Admin.refusal", wdCode);
	}

	
	
}
