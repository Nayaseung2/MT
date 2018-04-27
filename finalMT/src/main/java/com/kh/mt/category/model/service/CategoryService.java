package com.kh.mt.category.model.service;

import java.util.ArrayList;

import com.kh.mt.liveBJ.model.vo.LiveBj;

public interface CategoryService {

	ArrayList<LiveBj> BestBJ();

	ArrayList<LiveBj> UpBJ();

	ArrayList<LiveBj> etc();

	ArrayList<LiveBj> Music();

	ArrayList<LiveBj> Sport();

	ArrayList<LiveBj> Eat();

	ArrayList<LiveBj> Talk();

	ArrayList<LiveBj> Game();

}
