package com.kh.mt.category.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.mt.liveBJ.model.vo.LiveBj;

@Repository
public class CategoryDaoImpl implements CategoryDao{

	@Override
	public ArrayList<LiveBj> BestBJ(SqlSessionTemplate sqlSession) {
		ArrayList<LiveBj> list = (ArrayList)sqlSession.selectList("LiveBJ.BestBJ");
		return list;
	}

	@Override
	public ArrayList<LiveBj> UpBJ(SqlSessionTemplate sqlSession) {
		ArrayList<LiveBj> list = (ArrayList)sqlSession.selectList("LiveBJ.UpBJ");
		return list;
	}

	@Override
	public ArrayList<LiveBj> Eat(SqlSessionTemplate sqlSession) {
		ArrayList<LiveBj> list = (ArrayList)sqlSession.selectList("LiveBJ.Eat");
		return list;
	}

	@Override
	public ArrayList<LiveBj> Game(SqlSessionTemplate sqlSession) {
		ArrayList<LiveBj> list = (ArrayList)sqlSession.selectList("LiveBJ.Game");
		return list;
	}

	@Override
	public ArrayList<LiveBj> Talk(SqlSessionTemplate sqlSession) {
		ArrayList<LiveBj> list = (ArrayList)sqlSession.selectList("LiveBJ.Talk");
		return list;
	}

	@Override
	public ArrayList<LiveBj> Sport(SqlSessionTemplate sqlSession) {
		ArrayList<LiveBj> list = (ArrayList)sqlSession.selectList("LiveBJ.Sport");
		return list;
	}

	@Override
	public ArrayList<LiveBj> Music(SqlSessionTemplate sqlSession) {
		ArrayList<LiveBj> list = (ArrayList)sqlSession.selectList("LiveBJ.Music");
		return list;
	}

	@Override
	public ArrayList<LiveBj> etc(SqlSessionTemplate sqlSession) {
		ArrayList<LiveBj> list = (ArrayList)sqlSession.selectList("LiveBJ.etc");
		return list;
	}

}
