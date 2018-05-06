package com.kh.mt.category.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kh.mt.category.model.dao.CategoryDao;
import com.kh.mt.common.PageInfo;
import com.kh.mt.liveBJ.model.vo.LiveBj;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Autowired
	CategoryDao cd;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<LiveBj> BestBJ() {
		ArrayList<LiveBj> list = cd.BestBJ(sqlSession);
		
		return list;
	}

	/*@Override
	public ArrayList<LiveBj> UpBJ() {
		ArrayList<LiveBj> list = cd.UpBJ(sqlSession);
		
		return list;
	}*/

	@Override
	public ArrayList<LiveBj> etc(PageInfo pi) {
		ArrayList<LiveBj> list = cd.etc(sqlSession, pi);
		
		return list;
	}

	@Override
	public ArrayList<LiveBj> Music(PageInfo pi) {
		ArrayList<LiveBj> list = cd.Music(sqlSession, pi);
		
		return list;
	}

	@Override
	public ArrayList<LiveBj> Sport(PageInfo pi) {
		ArrayList<LiveBj> list = cd.Sport(sqlSession, pi);
		
		return list;
	}

	@Override
	public ArrayList<LiveBj> Eat(PageInfo pi) {
		ArrayList<LiveBj> list = cd.Eat(sqlSession, pi);
		
		return list;
	}

	@Override
	public ArrayList<LiveBj> Talk(PageInfo pi) {
		ArrayList<LiveBj> list = cd.Talk(sqlSession, pi);
		
		return list;
	}

	@Override
	public ArrayList<LiveBj> Game(PageInfo pi) {
		ArrayList<LiveBj> list = cd.Game(sqlSession, pi);
		
		return list;
	}

	@Override
	public ArrayList<LiveBj> GudockBJ(String mId, PageInfo pi) {
		ArrayList<LiveBj> list = cd.GudockBJ(sqlSession, mId, pi);
		return list;
	}

	@Override
	public ArrayList RankGame() {
		ArrayList<LiveBj> list = cd.RankGame(sqlSession);
		return list;
	}

	@Override
	public ArrayList RankEat() {
		ArrayList<LiveBj> list = cd.RankEat(sqlSession);
		return list;
	}

	@Override
	public ArrayList RankTalk() {
		ArrayList<LiveBj> list = cd.RankTalk(sqlSession);
		return list;
	}

	@Override
	public ArrayList RankSport() {
		ArrayList<LiveBj> list = cd.RankSport(sqlSession);
		return list;
	}

	@Override
	public int selectCount(String type) {
		int count = cd.selectCount(sqlSession, type);
		return count;
	}

	@Override
	public int selectCountGudck(String mId) {
		int count = cd.selectCountGudck(sqlSession, mId);
		return count;
	}

	

}
