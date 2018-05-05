package com.kh.mt.category.model.service;

import java.util.ArrayList;

import com.kh.mt.common.PageInfo;
import com.kh.mt.liveBJ.model.vo.LiveBj;

public interface CategoryService {

	ArrayList<LiveBj> BestBJ();

	/*ArrayList<LiveBj> UpBJ();*/

	ArrayList<LiveBj> etc(PageInfo pi);

	ArrayList<LiveBj> Music(PageInfo pi);

	ArrayList<LiveBj> Sport(PageInfo pi);

	ArrayList<LiveBj> Eat(PageInfo pi);

	ArrayList<LiveBj> Talk(PageInfo pi);

	ArrayList<LiveBj> Game(PageInfo pi);

	ArrayList<LiveBj> GudockBJ(String mId, PageInfo pi);

	ArrayList RankGame();

	ArrayList RankEat();

	ArrayList RankTalk();

	ArrayList RankSport();

	int selectCount(String type);

	int selectCountGudck(String mId);


}
