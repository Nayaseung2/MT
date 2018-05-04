package com.kh.mt.BJPayList.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.mt.BJPayList.model.vo.BJPayList;
import com.kh.mt.BJPayList.model.vo.Black;
import com.kh.mt.BJPayList.model.vo.Expeach;
import com.kh.mt.BJPayList.model.vo.Subscribe;
import com.kh.mt.common.PageInfo;
import com.kh.mt.member.model.vo.Member;
import com.kh.mt.pay.model.vo.Pay;

@Repository
public class BJPayListDaoImpl implements BJPayListDao{
	
	@Override
	public int selectPeach(SqlSessionTemplate sqlSession, String mcode) {
		int peach = sqlSession.selectOne("BJPayList.selectPeach", mcode);
		return peach;
	}
	
	@Override
	public int selectwdprice(SqlSessionTemplate sqlSession, String mcode) {
		int wd_price = 0;
		wd_price = sqlSession.selectOne("BJPayList.selectwdprice", mcode);

		if (wd_price == 0) {
			System.out.println("응???");
		}
		return wd_price;
	}

	@Override
	public int insertBJPayList(SqlSessionTemplate sqlSession, BJPayList bjpvo) {
		int result = sqlSession.insert("BJPayList.insertBJPayList", bjpvo);
		int peach = 0;
		if (result == 1) {
			System.out.println("result 값이..."+result);
			result = 0;
			peach = sqlSession.selectOne("BJPayList.selectPeach", bjpvo.getMcode());
			if (peach >= 0) {
				System.out.println(peach);
				int price = bjpvo.getPrice();
				
				Pay p = new Pay();
				p.setMcode(bjpvo.getMcode());
				p.setPeach_code(peach-(price/70));
				
				result=sqlSession.update("BJPayList.updatePeach", p);
			}
		}
		
		
		return result;
		
		
	}

	@Override
	public ArrayList<BJPayList> selectWithdrawList(SqlSessionTemplate sqlSession, String mcode) {
		ArrayList<BJPayList> list = null;
		
		list = (ArrayList) sqlSession.selectList("BJPayList.selectWithdrawList",mcode);
		System.out.println("이걸까??"+list);
		
		return list;
	}

	@Override
	public ArrayList<BJPayList> selectWithdrawAllList(SqlSessionTemplate sqlSession, String mcode, PageInfo pi) {
		ArrayList<BJPayList> list = null;
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("BJPayList.selectWithdrawAllList",mcode,rowBounds);
		System.out.println("이걸까요?>???ㅋㅋㅋ??"+list);
		
		return list;
	}

	@Override
	public HashMap<String, String> WithdrawListAllCount(SqlSessionTemplate sqlSession, String mcode) {
		HashMap<String, String> list = sqlSession.selectOne("BJPayList.selectWDAllCount",mcode);
		
		return list;
	}

	@Override
	public HashMap<String, String> ProfitBjAllCount(SqlSessionTemplate sqlSession, String mcode) {
		HashMap<String, String> list = sqlSession.selectOne("BJPayList.selectProfitBjAllCount", mcode);
		
		return list;
	}

	@Override
	public ArrayList<Expeach> selectProfitBjAllList(SqlSessionTemplate sqlSession, String mcode, PageInfo pi) {
		ArrayList<Expeach> list = null;
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("BJPayList.selectProfitBjAllList",mcode,rowBounds);
		
		return list;
	}

	@Override
	public ArrayList<Expeach> selectProfitBjList(SqlSessionTemplate sqlSession, String mcode) {
		ArrayList<Expeach> list = null;
		
		list = (ArrayList) sqlSession.selectList("BJPayList.selectProfitBjList",mcode);
		
		return list;
	}

	@Override
	public HashMap<String, String> MyFanAllCount(SqlSessionTemplate sqlSession, String mcode) {
		HashMap<String, String> list = sqlSession.selectOne("BJPayList.selectMyFanAllCount", mcode);
		
		return list;
	}

	@Override
	public ArrayList<Subscribe> selectMyFanAllList(SqlSessionTemplate sqlSession, String mcode, PageInfo pi) {
		ArrayList<Subscribe> list = null;
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("BJPayList.selectMyFanAllList",mcode,rowBounds);
		
		return list;
	}

	@Override
	public ArrayList<Subscribe> selectMyFanList(SqlSessionTemplate sqlSession, String mcode) {
		ArrayList<Subscribe> list = null;
		
		list = (ArrayList) sqlSession.selectList("BJPayList.selectMyFanList",mcode);
		
		return list;
	}

	@Override
	public HashMap<String, String> BlackListAllCount(SqlSessionTemplate sqlSession, String mcode) {
		HashMap<String, String> list = sqlSession.selectOne("BJPayList.BlackListAllCount", mcode);
		
		return list;
	}

	@Override
	public ArrayList<Black> selectBlackListAllList(SqlSessionTemplate sqlSession, String mcode, PageInfo pi) {
		ArrayList<Black> list = null;
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		list = (ArrayList) sqlSession.selectList("BJPayList.selectBlackListAllList",mcode,rowBounds);
		
		return list;
	}

	@Override
	public int BlackcancelUpdate(SqlSessionTemplate sqlSession , String mId) {
		int result = sqlSession.update("BJPayList.UpdateBlackcancel", mId);
		return result;
	}

	@Override
	public int updateAccount(SqlSessionTemplate sqlSession, Member m) {
		System.out.println("eldpdldh"+m);
		int result = sqlSession.update("Member.updateAccount", m);
		System.out.println(result+"여기는 디에이오");
		return result;
	}

	@Override
	public int SelectCountBlack(SqlSessionTemplate sqlSession, String mcode) {
		int BlackCount = sqlSession.selectOne("BJPayList.SelectCountBlack", mcode);
		
		return BlackCount;
	}

	@Override
	public int SelectwdSuccese(SqlSessionTemplate sqlSession, String mcode) {
		int wdSuccese = sqlSession.selectOne("BJPayList.SelectwdSuccese", mcode);
		return wdSuccese;
	}

	@Override
	public int Selectwdloding(SqlSessionTemplate sqlSession, String mcode) {
		int wdloding = sqlSession.selectOne("BJPayList.Selectwdloding", mcode);
		return wdloding;
	}

	@Override
	public int SelectMyFanCount(SqlSessionTemplate sqlSession, String mcode) {
		int MyFanCount = sqlSession.selectOne("BJPayList.SelectMyFanCount", mcode);
		return MyFanCount;
	}

	@Override
	public int SelectProfitPeach(SqlSessionTemplate sqlSession, String mcode) {
		int ProfitPeach = sqlSession.selectOne("BJPayList.SelectProfitPeach", mcode);
		return ProfitPeach;
	}






}
