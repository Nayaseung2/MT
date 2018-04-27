package com.kh.mt.category.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mt.category.model.service.CategoryService;
import com.kh.mt.liveBJ.model.vo.LiveBj;

@Controller
public class CategoryController {
	@Autowired
	CategoryService cs;
	
	
	public CategoryController() {
		// TODO Auto-generated constructor stub
	}
	

	
	
	//즐겨찾기 페이지
	@RequestMapping("good.cg")
	public ModelAndView Good(ModelAndView mv){
		
	
		mv.setViewName("category/Good");
		return mv;
	}
	
	
	//베스트 BJ 페이지
	@RequestMapping("bestBJ.cg")
	public ModelAndView BestBJ(ModelAndView mv){
			
		ArrayList<LiveBj> list = cs.BestBJ();
		mv.addObject("list",list);	
		mv.setViewName("category/BestBJ");
		return mv;
	}
	
	
	//추천 BJ 페이지
	@RequestMapping("upBJ.cg")
	public ModelAndView UpBJ(ModelAndView mv){
				
		ArrayList<LiveBj> list = cs.UpBJ();
		mv.addObject("list",list);		
		mv.setViewName("category/UpBJ");
		return mv;
	}
	
	
	//랭크 BJ 페이지 우선보류 굉장히 까다로운 것임!!
	@RequestMapping("rankBJ.cg")
	public ModelAndView RankBJ(ModelAndView mv){
							
		mv.setViewName("category/RankBJ");
		return mv;
	}
	
	
	//게임 페이지
	@RequestMapping("game.cg")
	public ModelAndView Game(ModelAndView mv){
					
		ArrayList<LiveBj> list = cs.Game();
		mv.addObject("list",list);			
		mv.setViewName("category/Game");
		return mv;
	}
		
	//토크&캠방 페이지
	@RequestMapping("talk.cg")
	public ModelAndView Talk(ModelAndView mv){
					
		ArrayList<LiveBj> list = cs.Talk();
		mv.addObject("list",list);			
		mv.setViewName("category/Talk");
		return mv;
	}
	
	
	//먹방 페이지
	@RequestMapping("eat.cg")
	public ModelAndView Eat(ModelAndView mv){
					
		ArrayList<LiveBj> list = cs.Eat();
		mv.addObject("list",list);			
		mv.setViewName("category/Eat");
		return mv;
	}
	
	
	//스포츠 페이지
	@RequestMapping("sport.cg")
	public ModelAndView Sport(ModelAndView mv){
					
		ArrayList<LiveBj> list = cs.Sport();
		mv.addObject("list",list);			
		mv.setViewName("category/Sport");
		return mv;
	}
	
	
	//음악 페이지
	@RequestMapping("music.cg")
	public ModelAndView Music(ModelAndView mv){
					
		ArrayList<LiveBj> list = cs.Music();
		mv.addObject("list",list);			
		mv.setViewName("category/Music");
		return mv;
	}
	
	
	//기타 페이지
	@RequestMapping("etc.cg")
	public ModelAndView Etc(ModelAndView mv){
					
		ArrayList<LiveBj> list = cs.etc();
		mv.addObject("list",list);			
		mv.setViewName("category/etc");
		return mv;
	}
	
	
	
	

}
