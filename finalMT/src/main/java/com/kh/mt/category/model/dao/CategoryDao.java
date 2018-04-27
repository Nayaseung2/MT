package com.kh.mt.category.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mt.liveBJ.model.vo.LiveBj;

public interface CategoryDao {

	ArrayList<LiveBj> BestBJ(SqlSessionTemplate sqlSession);

	ArrayList<LiveBj> UpBJ(SqlSessionTemplate sqlSession);

	ArrayList<LiveBj> Eat(SqlSessionTemplate sqlSession);

	ArrayList<LiveBj> Game(SqlSessionTemplate sqlSession);

	ArrayList<LiveBj> Talk(SqlSessionTemplate sqlSession);

	ArrayList<LiveBj> Sport(SqlSessionTemplate sqlSession);

	ArrayList<LiveBj> Music(SqlSessionTemplate sqlSession);

	ArrayList<LiveBj> etc(SqlSessionTemplate sqlSession);


}
