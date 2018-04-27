package com.kh.mt.category.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kh.mt.category.model.dao.CategoryDao;
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

	@Override
	public ArrayList<LiveBj> UpBJ() {
		ArrayList<LiveBj> list = cd.UpBJ(sqlSession);
		
		return list;
	}

	@Override
	public ArrayList<LiveBj> etc() {
		ArrayList<LiveBj> list = cd.etc(sqlSession);
		
		return list;
	}

	@Override
	public ArrayList<LiveBj> Music() {
		ArrayList<LiveBj> list = cd.Music(sqlSession);
		
		return list;
	}

	@Override
	public ArrayList<LiveBj> Sport() {
		ArrayList<LiveBj> list = cd.Sport(sqlSession);
		
		return list;
	}

	@Override
	public ArrayList<LiveBj> Eat() {
		ArrayList<LiveBj> list = cd.Eat(sqlSession);
		
		return list;
	}

	@Override
	public ArrayList<LiveBj> Talk() {
		ArrayList<LiveBj> list = cd.Talk(sqlSession);
		
		return list;
	}

	@Override
	public ArrayList<LiveBj> Game() {
		ArrayList<LiveBj> list = cd.Game(sqlSession);
		
		return list;
	}

}
