package com.kh.mt.category.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mt.common.PageInfo;
import com.kh.mt.liveBJ.model.vo.LiveBj;

@Repository
public class CategoryDaoImpl implements CategoryDao{

	@Override
	public ArrayList<LiveBj> BestBJ(SqlSessionTemplate sqlSession) {
		ArrayList<LiveBj> list = (ArrayList)sqlSession.selectList("LiveBJ.BestBJ");
		return list;
	}

	/*@Override
	public ArrayList<LiveBj> UpBJ(SqlSessionTemplate sqlSession) {
		ArrayList<LiveBj> list = (ArrayList)sqlSession.selectList("LiveBJ.UpBJ");
		return list;
	}*/

	@Override
	public ArrayList<LiveBj> Eat(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<LiveBj> list1 = (ArrayList)sqlSession.selectList("LiveBJ.Eat",null, rowBounds);
		ArrayList<LiveBj> list= new ArrayList<>();
		for(int i =0; i<list1.size();i++){
			String mid = list1.get(i).getMid();
			System.out.println("bJ id: "+mid);
			LiveBj bj = sqlSession.selectOne("LiveBJ.EatInfo", mid);
			System.out.println("bj to String : "+bj);
			list.add(bj);
		}
		return list;
	}

	@Override
	public ArrayList<LiveBj> Game(SqlSessionTemplate sqlSession,PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<LiveBj> list1 = (ArrayList)sqlSession.selectList("LiveBJ.Game",null, rowBounds);
		ArrayList<LiveBj> list= new ArrayList<>();
		for(int i =0; i<list1.size();i++){
			String mid = list1.get(i).getMid();
			System.out.println("bJ id: "+mid);
			LiveBj bj = sqlSession.selectOne("LiveBJ.GameInfo", mid);
			System.out.println("bj to String : "+bj);
			list.add(bj);
		}
		System.out.println("list뭐냐"+ list);
		//ArrayList<LiveBj> list = (ArrayList)sqlSession.selectList("LiveBJ.Game");
		return list;
	}

	@Override
	public ArrayList<LiveBj> Talk(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<LiveBj> list1 = (ArrayList)sqlSession.selectList("LiveBJ.Talk",null, rowBounds);
		ArrayList<LiveBj> list= new ArrayList<>();
		for(int i =0; i<list1.size();i++){
			String mid = list1.get(i).getMid();
			System.out.println("bJ id: "+mid);
			LiveBj bj = sqlSession.selectOne("LiveBJ.TalkInfo", mid);
			System.out.println("bj to String : "+bj);
			list.add(bj);
		}
		return list;
	}

	@Override
	public ArrayList<LiveBj> Sport(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<LiveBj> list1 = (ArrayList)sqlSession.selectList("LiveBJ.Sport",null, rowBounds);
		ArrayList<LiveBj> list= new ArrayList<>();
		for(int i =0; i<list1.size();i++){
			String mid = list1.get(i).getMid();
			System.out.println("bJ id: "+mid);
			LiveBj bj = sqlSession.selectOne("LiveBJ.SportInfo", mid);
			System.out.println("bj to String : "+bj);
			list.add(bj);
		}
		return list;
	}

	@Override
	public ArrayList<LiveBj> Music(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<LiveBj> list1 = (ArrayList)sqlSession.selectList("LiveBJ.Music",null, rowBounds);
		ArrayList<LiveBj> list= new ArrayList<>();
		for(int i =0; i<list1.size();i++){
			String mid = list1.get(i).getMid();
			System.out.println("bJ id: "+mid);
			LiveBj bj = sqlSession.selectOne("LiveBJ.MusicInfo", mid);
			System.out.println("bj to String : "+bj);
			list.add(bj);
		}
		return list;
	}

	@Override
	public ArrayList<LiveBj> etc(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<LiveBj> list1 = (ArrayList)sqlSession.selectList("LiveBJ.etc",null, rowBounds);
		ArrayList<LiveBj> list= new ArrayList<>();
		for(int i =0; i<list1.size();i++){
			String mid = list1.get(i).getMid();
			System.out.println("bJ id: "+mid);
			LiveBj bj = sqlSession.selectOne("LiveBJ.etcInfo", mid);
			System.out.println("bj to String : "+bj);
			list.add(bj);
		}
		return list;
	}

	@Override
	public ArrayList<LiveBj> GudockBJ(SqlSessionTemplate sqlSession, String mId, PageInfo pi) {
		int offset = (pi.getCurrentPage() -1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		ArrayList<LiveBj> list1 = (ArrayList)sqlSession.selectList("LiveBJ.Gudock", mId, rowBounds);
		ArrayList<LiveBj> list= new ArrayList<>();
		for(int i =0; i<list1.size();i++){
			String mid = list1.get(i).getMid();
			System.out.println("bJ id: "+mid);
			LiveBj bj = sqlSession.selectOne("LiveBJ.GudockInfo", mid);
			System.out.println("bj to String : "+bj);
			list.add(bj);
		}
		return list;
	}

	@Override
	public ArrayList<LiveBj> RankGame(SqlSessionTemplate sqlSession) {
		ArrayList<LiveBj> list = (ArrayList)sqlSession.selectList("LiveBJ.RankGame");
		return list;
	}

	@Override
	public ArrayList<LiveBj> RankEat(SqlSessionTemplate sqlSession) {
		ArrayList<LiveBj> list = (ArrayList)sqlSession.selectList("LiveBJ.RankEat");
		return list;
	}

	@Override
	public ArrayList<LiveBj> RankTalk(SqlSessionTemplate sqlSession) {
		ArrayList<LiveBj> list = (ArrayList)sqlSession.selectList("LiveBJ.RankTalk");
		return list;
	}

	@Override
	public ArrayList<LiveBj> RankSport(SqlSessionTemplate sqlSession) {
		ArrayList<LiveBj> list = (ArrayList)sqlSession.selectList("LiveBJ.RankSport");
		
		return list;
	}
	//int offset = (pi.getCurrentPage() -1) * pi.getLimit();
	//RowBounds rowBounds = new RowBounds(offset, pi.getLimit());

	@Override
	public int selectCount(SqlSessionTemplate sqlSession, String type) {
		int count = sqlSession.selectOne("LiveBJ.selectCount", type);
		return count;
	}

	@Override
	public int selectCountGudck(SqlSessionTemplate sqlSession, String mId) {
		int count = sqlSession.selectOne("LiveBJ.selectCountGudck", mId);
		return count;
	}
			
}
