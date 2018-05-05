package com.kh.mt.category.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.mt.common.PageInfo;
import com.kh.mt.liveBJ.model.vo.LiveBj;

public interface CategoryDao {

	ArrayList<LiveBj> BestBJ(SqlSessionTemplate sqlSession);

	/*ArrayList<LiveBj> UpBJ(SqlSessionTemplate sqlSession);*/

	ArrayList<LiveBj> Eat(SqlSessionTemplate sqlSession, PageInfo pi);

	ArrayList<LiveBj> Game(SqlSessionTemplate sqlSession, PageInfo pi);

	ArrayList<LiveBj> Talk(SqlSessionTemplate sqlSession, PageInfo pi);

	ArrayList<LiveBj> Sport(SqlSessionTemplate sqlSession, PageInfo pi);

	ArrayList<LiveBj> Music(SqlSessionTemplate sqlSession, PageInfo pi);

	ArrayList<LiveBj> etc(SqlSessionTemplate sqlSession, PageInfo pi);

	ArrayList<LiveBj> GudockBJ(SqlSessionTemplate sqlSession, String mId, PageInfo pi);

	ArrayList<LiveBj> RankGame(SqlSessionTemplate sqlSession);

	ArrayList<LiveBj> RankEat(SqlSessionTemplate sqlSession);

	ArrayList<LiveBj> RankTalk(SqlSessionTemplate sqlSession);

	ArrayList<LiveBj> RankSport(SqlSessionTemplate sqlSession);

	int selectCount(SqlSessionTemplate sqlSession, String type);

	int selectCountGudck(SqlSessionTemplate sqlSession, String mId);


}
