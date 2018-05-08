package com.kh.mt.category.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mt.category.model.service.CategoryService;
import com.kh.mt.common.PageInfo;
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
	public ModelAndView Good(ModelAndView mv, String mId, String newCurrentPage){
		HashMap<String, Object> map = new HashMap<String, Object>();
		int count = cs.selectCountGudck(mId);
		PageInfo pi = addUserPage(newCurrentPage, count);
		if(count != 0){
			ArrayList<LiveBj> list = cs.GudockBJ(mId,pi);
			map.put("list", list);
		}
		map.put("pi", pi);
		
		mv.addObject("map", map);
		if(newCurrentPage == null){
			mv.setViewName("category/Good");
		}else{
			mv.setViewName("jsonView");
		}
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
	/*@RequestMapping("upBJ.cg")
	public ModelAndView UpBJ(ModelAndView mv){
				
		ArrayList<LiveBj> list = cs.UpBJ();
		mv.addObject("list",list);		
		mv.setViewName("category/UpBJ");
		return mv;
	}*/
	
	
	//랭크 BJ 페이지 우선보류 굉장히 까다로운 것임!!
	@RequestMapping("rankBJ.cg")
	public ModelAndView RankBJ(ModelAndView mv){
		
		ArrayList list1 = cs.RankEat();
		ArrayList list2 = cs.RankGame();
		ArrayList list3 = cs.RankTalk();
		ArrayList list4 = cs.RankSport();
		
		mv.addObject("list1", list1);
		mv.addObject("list2", list2);
		mv.addObject("list3", list3);
		mv.addObject("list4", list4);
		mv.setViewName("category/RankBJ");
		return mv;
	}
	
	
	//게임 페이지
	@RequestMapping("game.cg")
	public ModelAndView Game(ModelAndView mv, String newCurrentPage){
		String type = "게임";
		
		int count = cs.selectCount(type);
		PageInfo pi = addUserPage(newCurrentPage, count);
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<LiveBj> list = cs.Game(pi);
		
		map.put("list", list);
		map.put("pi", pi);
		
		mv.addObject("map", map);
		if(newCurrentPage == null){
			mv.setViewName("category/Game");
		}else{
			mv.setViewName("jsonView");
		}
		return mv;
	}
		
	//토크&캠방 페이지
	@RequestMapping("talk.cg")
	public ModelAndView Talk(ModelAndView mv,String newCurrentPage){
		String type = "토크/캠방";
		int count = cs.selectCount(type);
		
		PageInfo pi = addUserPage(newCurrentPage, count);
		
		ArrayList<LiveBj> list = cs.Talk(pi);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pi", pi);
		
		mv.addObject("map", map);
		if(newCurrentPage == null){
			mv.setViewName("category/Talk");
		}else{
			mv.setViewName("jsonView");
		}
		
		return mv;
	}
	
	
	//먹방 페이지
	@RequestMapping("eat.cg")
	public ModelAndView Eat(ModelAndView mv,String newCurrentPage){
		String type = "먹방";
		int count = cs.selectCount(type);
		
		PageInfo pi = addUserPage(newCurrentPage, count);
		
		ArrayList<LiveBj> list = cs.Eat(pi);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pi", pi);
		
		mv.addObject("map", map);
		if(newCurrentPage == null){
			mv.setViewName("category/Eat");
		}else{
			mv.setViewName("jsonView");
		}
		
		return mv;
	}
	
	
	//스포츠 페이지
	@RequestMapping("sport.cg")
	public ModelAndView Sport(ModelAndView mv,String newCurrentPage){
		String type = "스포츠";
		int count = cs.selectCount(type);
		
		PageInfo pi = addUserPage(newCurrentPage, count);
		ArrayList<LiveBj> list = cs.Sport(pi);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pi", pi);
		
		mv.addObject("map", map);
		if(newCurrentPage == null){
			mv.setViewName("category/Sport");
		}else{
			mv.setViewName("jsonView");
		}
		
		return mv;
	}
	
	
	//음악 페이지
	@RequestMapping("music.cg")
	public ModelAndView Music(ModelAndView mv,String newCurrentPage){
		String type = "음악";
		int count = cs.selectCount(type);
		
		PageInfo pi = addUserPage(newCurrentPage, count);
		ArrayList<LiveBj> list = cs.Music(pi);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pi", pi);
		
		mv.addObject("map", map);
		if(newCurrentPage == null){
			mv.setViewName("category/Music");
		}else{
			mv.setViewName("jsonView");
		}	
		return mv;
	}
	
	
	//기타 페이지
	@RequestMapping("etc.cg")
	public ModelAndView Etc(ModelAndView mv,String newCurrentPage){
		String type = "기타";
		int count = cs.selectCount(type);
		
		PageInfo pi = addUserPage(newCurrentPage, count);
		ArrayList<LiveBj> list = cs.etc(pi);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pi", pi);
		
		mv.addObject("map", map);
		if(newCurrentPage == null){
			mv.setViewName("category/etc");
		}else{
			mv.setViewName("jsonView");
		}		
		return mv;
	}
	
	//페이징처리
	public PageInfo addUserPage(String newCurrentPage, int count){
		
		int currentPage = 1;
		int limit = 0;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		int listCount = 0;

		limit = 12;
			
		listCount = count; 
			
		if(newCurrentPage != null){
			currentPage = Integer.parseInt(newCurrentPage);
		}
			
		maxPage = (int)((double)listCount / limit + 0.9);
		
		startPage = (((int)((double)currentPage / limit + 0.9 -1)) * limit) +1;
		
		endPage = startPage + limit -1;
			
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		return new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
	}			

	/*public PageInfo addPage(String newCurrentPage, String type){
		System.out.println("newCurrentPage"+newCurrentPage);
		int currentPage = 1;
		int limit = 0;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		int listCount = 0;

		limit = 16;
		
		if(newCurrentPage != null){
			currentPage = Integer.parseInt(newCurrentPage);
		}
		
		
		listCount = cs.selectCount(type);
		maxPage = (int)((double)listCount / limit + 0.9);
		 
		startPage = (((int)((double)currentPage / limit + 0.9)-1) * limit) +1;
		
		endPage = startPage + limit -1;
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		return new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
	}*/
	
	/*public static void main(String[] args) {
		int currentPage = 1;
		int limit = 0;
		int startPage = 0;
		
		limit =10;
		
		System.out.println("limit1"+limit);
		
		startPage = ((int)((double)currentPage / limit + 0.9)-1) * limit + 1;
		
		System.out.println((((int)((double)currentPage / limit + 0.9)-1) * limit) +1);
		
		System.out.println();
		
		System.out.println("limit2"+limit);
		
		System.out.println("startPage"+startPage);
	}*/
}
