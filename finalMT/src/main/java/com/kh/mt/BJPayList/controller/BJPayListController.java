package com.kh.mt.BJPayList.controller;

import java.awt.RenderingHints.Key;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.xml.crypto.dsig.spec.HMACParameterSpec;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JacksonInject.Value;
import com.kh.mt.BJPayList.model.service.BJPayListService;
import com.kh.mt.BJPayList.model.vo.BJPayList;
import com.kh.mt.BJPayList.model.vo.Black;
import com.kh.mt.BJPayList.model.vo.Expeach;
import com.kh.mt.BJPayList.model.vo.Subscribe;
import com.kh.mt.common.PageInfo;


@CrossOrigin(origins="*")
@Controller
public class BJPayListController {
	
	@Autowired
	private BJPayListService bjp;
	
	
	public BJPayListController() {
		// TODO Auto-generated constructor stub
	}
	
	//BJ 수익관리 페이지  메인
	@RequestMapping("bjPayMain.bjp")
	public ModelAndView BJPayMain(ModelAndView mv){
		
		mv.setViewName("bjPayList/bjPayMain");
		return mv;
				
	}
	
	//BJ 방송 접속자 수 관리
	@RequestMapping("loginUser.bjp")
	public ModelAndView LoginUsers(ModelAndView mv){
		
		mv.setViewName("bjPayList/LoginUser");
		return mv;
				
	}
	
	//BJ 추천수  관리
	@RequestMapping("GoodUser.bjp")
	public ModelAndView GoodUser(ModelAndView mv){
		
		mv.setViewName("bjPayList/GoodUser");
		return mv;
				
	}
	
	//BJ 수익 관리
	@RequestMapping("ProfitBj.bjp")
	public ModelAndView ProfitBj(ModelAndView mv, String newCurrentPage,  String mcode){
		System.out.println(mcode);
		HashMap<String, String> list3 = bjp.ProfitBjAllCount(mcode);
		
		PageInfo pi = ProfitBjaddPage(newCurrentPage, "ProfitBj", mcode);
		
		ArrayList<Expeach> list2 = bjp.selectProfitBjAllList(mcode,pi);
		
		
		ArrayList<Expeach> list= bjp.selectProfitBjList(mcode);;
		String day = null;
		ArrayList<Expeach> expeach = new ArrayList<Expeach>();
		for (int i = 0; i < list.size(); i++) {
			if (day == null || !day.equals(list.get(i).getSend_date())) {
				int price = 0;
				day = list.get(i).getSend_date();
				for (int j = 0; j < list.size(); j++) {
					if(day.equals(list.get(j).getSend_date())){
						price+=list.get(j).getPeachcount();
					}
				}
				Expeach daybj = new Expeach();
				daybj.setSend_date(day);
				daybj.setPeachcount(price);
				expeach.add(daybj);
				
				
			}
			
		}
		System.out.println(expeach);
		mv.addObject("pi", pi);
		mv.addObject("list2", list2);
		mv.addObject("list3", list3);
		mv.addObject("dayList", expeach);
		mv.setViewName("bjPayList/ProfitBj");
		
		
		if (newCurrentPage != null) {
			mv.clear();
			HashMap hmap = new HashMap();
			
			hmap.put("list2", list2);
			hmap.put("pi", pi);
			
			mv.addObject("list", hmap);
			
			System.out.println(hmap);
			mv.setViewName("jsonView");
			
		}
		
		return mv;
				
	}
	
	

	//**********************************페이징 처리**************************************
	public PageInfo ProfitBjaddPage(String newCurrentPage, String type, String mcode){
		HashMap<String, String> list = bjp.ProfitBjAllCount(mcode);
		
		int currentPage = 1;
		int limit = 0;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		int listCount = 0;

		limit = 10;
		if(type.equals("ProfitBj")){
			listCount = Integer.parseInt(String.valueOf(list.get("PROFITBJ")));
		}
		
		if(newCurrentPage != null){
			currentPage = Integer.parseInt(newCurrentPage);
		}
		
		maxPage = (int)((double)listCount / limit + 0.9);
		
		startPage = ((int)((double)currentPage / limit + 0.9)-1) * limit + 1;
		
		endPage = startPage + limit -1;
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		return new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
	}
	
	
	
	
	
	
	
	//.BJ 방송 블랙 회ㅏ원 관리
	@RequestMapping("BlackList.bjp")
	public ModelAndView BlackList(ModelAndView mv, String newCurrentPage, String mcode){
		System.out.println(mcode);
		HashMap<String, String> list3 = bjp.BlackListAllCount(mcode);
		
		PageInfo pi = BlackListaddPage(newCurrentPage, "BlackList", mcode);
		
		ArrayList<Black> list2 = bjp.selectBlackListAllList(mcode,pi);
		
		
		String day = null;
		
		mv.addObject("pi", pi);
		mv.addObject("list2", list2);
		mv.addObject("list3", list3);
		mv.setViewName("bjPayList/BlackList");
		
		
		if (newCurrentPage != null) {
			mv.clear();
			HashMap hmap = new HashMap();
			
			hmap.put("list2", list2);
			hmap.put("pi", pi);
			
			mv.addObject("list", hmap);
			
			System.out.println(hmap);
			mv.setViewName("jsonView");
			
		}
		
		return mv;
				
				
	}
	
	
	//**********************************페이징 처리**************************************
		public PageInfo BlackListaddPage(String newCurrentPage, String type, String mcode){
			HashMap<String, String> list = bjp.BlackListAllCount(mcode);
			
			int currentPage = 1;
			int limit = 0;
			int maxPage = 0;
			int startPage = 0;
			int endPage = 0;
			int listCount = 0;

			limit = 10;
			if(type.equals("BlackList")){
				listCount = Integer.parseInt(String.valueOf(list.get("BLACKLIST")));
			}
			
			if(newCurrentPage != null){
				currentPage = Integer.parseInt(newCurrentPage);
			}
			
			maxPage = (int)((double)listCount / limit + 0.9);
			
			startPage = ((int)((double)currentPage / limit + 0.9)-1) * limit + 1;
			
			endPage = startPage + limit -1;
			
			if(maxPage < endPage){
				endPage = maxPage;
			}
			
			return new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		}
			
	
	
	@RequestMapping("blackcancel.bjp")
	public ModelAndView blackcancel(ModelAndView mv,  String mId){
		
		int result = bjp.BlackcancelUpdate(mId);
		
		
		if(result > 0 ) {
			mv.addObject("result", result);
			mv.setViewName("jsonView");
		}else{
			mv.addObject("result", result);
			mv.setViewName("jsonView");
		}
		
		return mv;
		
	}
	
	//BJ 팬 관리 페이지
	@RequestMapping("MyFan.bjp")
	public ModelAndView MyFan(ModelAndView mv, String newCurrentPage,  String mcode){
		System.out.println(mcode);
		HashMap<String, String> list3 = bjp.MyFanAllCount(mcode);
		
		PageInfo pi = MyFanaddPage(newCurrentPage, "MyFan", mcode);
		
		ArrayList<Subscribe> list2 = bjp.selectMyFanAllList(mcode,pi);
		System.out.println("list2 이다 팬관리"+list2);
		
		System.out.println("??????????????????????????????????????????제발"+newCurrentPage);
		ArrayList<Subscribe> list= bjp.selectMyFanList(mcode);;
		String day = null;
		ArrayList<Subscribe> Subscribe = new ArrayList<Subscribe>();
		for (int i = 0; i < list.size(); i++) {
			if (day == null || !day.equals(list.get(i).getRead_date())) {
				int price = 0;
				day = list.get(i).getRead_date();
				for (int j = 0; j < list.size(); j++) {
					if(day.equals(list.get(j).getRead_date())){
						price+=1;
					}
				}
				Subscribe daybj = new Subscribe();
				daybj.setRead_date(day);
				daybj.setReader_num(price);
				Subscribe.add(daybj);
				
				
			}
			
		}
		System.out.println(Subscribe);
		mv.addObject("pi", pi);
		mv.addObject("list2", list2);
		mv.addObject("list3", list3);
		mv.addObject("dayList", Subscribe);
		mv.setViewName("bjPayList/MyFan");
		
		
		if (newCurrentPage != null) {
			mv.clear();
			HashMap hmap = new HashMap();
			
			hmap.put("list2", list2);
			hmap.put("pi", pi);
			
			mv.addObject("list", hmap);
			
			System.out.println(hmap);
			mv.setViewName("jsonView");
			
		}
		
		return mv;
				
	}
	
	
	
//**********************************페이징 처리**************************************
	public PageInfo MyFanaddPage(String newCurrentPage, String type, String mcode){
		HashMap<String, String> list = bjp.MyFanAllCount(mcode);
		
		int currentPage = 1;
		int limit = 0;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		int listCount = 0;

		limit = 10;
		System.out.println("라스트다~~~~"+list);
		if(type.equals("MyFan")){
			listCount = Integer.parseInt(String.valueOf(list.get("MYFAN")));
		}
		
		if(newCurrentPage != null){
			currentPage = Integer.parseInt(newCurrentPage);
		}
		
		maxPage = (int)((double)listCount / limit + 0.9);
		
		startPage = ((int)((double)currentPage / limit + 0.9)-1) * limit + 1;
		
		endPage = startPage + limit -1;
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		return new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
	}
	


	
	
	
	
	//BJ 출금 관리 페이지
	@RequestMapping("WithdrawList.bjp")
	public ModelAndView WithdrawList(ModelAndView mv, String newCurrentPage,  String mcode){
		HashMap<String, String> list3 = bjp.WithdrawListAllCount(mcode);
		
		PageInfo pi = addPage(newCurrentPage, "WithdrawList", mcode);
		
		ArrayList<BJPayList> list2 = bjp.selectWithdrawAllList(mcode,pi);
		
		
		ArrayList<BJPayList> list= bjp.selectWithdrawList(mcode);
		String day = null;
		ArrayList<BJPayList> dayList = new ArrayList<BJPayList>();
		for (int i = 0; i < list.size(); i++) {
			if (day == null || !day.equals(list.get(i).getWd_date())) {
				int price = 0;
				day = list.get(i).getWd_date();
				for (int j = 0; j < list.size(); j++) {
					if(day.equals(list.get(j).getWd_date())){
						price+=list.get(j).getPrice();
					}
				}
				BJPayList daybj = new BJPayList();
				daybj.setWd_date(day);
				daybj.setPrice(price);
				dayList.add(daybj);
				
				
			}
			
		}
		System.out.println(dayList);
		mv.addObject("pi", pi);
		mv.addObject("list2", list2);
		mv.addObject("list3", list3);
		mv.addObject("dayList", dayList);
		mv.setViewName("bjPayList/WithdrawList");
		
		
		if (newCurrentPage != null) {
			mv.clear();
			HashMap hmap = new HashMap();
			
			hmap.put("list2", list2);
			hmap.put("pi", pi);
			
			mv.addObject("list", hmap);
			
			System.out.println(hmap);
			mv.setViewName("jsonView");
			
		}
		
		
		
		
		
		return mv;
				
	}
	
	
	
	
	//**********************************페이징 처리**************************************
	public PageInfo addPage(String newCurrentPage, String type, String mcode){
		HashMap<String, String> list = bjp.WithdrawListAllCount(mcode);
		
		int currentPage = 1;
		int limit = 0;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		int listCount = 0;

		limit = 10;
		
		if(type.equals("WithdrawList")){
			listCount = Integer.parseInt(String.valueOf(list.get("WDLIST")));
		}else if(type.equals("WithdrawListY")){
			listCount = Integer.parseInt(String.valueOf(list.get("WDSUCCESS")));
		}else if(type.equals("WithdrawListN")){
			listCount = Integer.parseInt(String.valueOf(list.get("WDING")));
		}else if(type.equals("WithdrawListA")){
			listCount = Integer.parseInt(String.valueOf(list.get("WDFAIL")));
		}
		
		if(newCurrentPage != null){
			currentPage = Integer.parseInt(newCurrentPage);
		}
		
		maxPage = (int)((double)listCount / limit + 0.9);
		
		startPage = ((int)((double)currentPage / limit + 0.9)-1) * limit + 1;
		
		endPage = startPage + limit -1;
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		return new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
	}
	

	
	

	//BJ 시청자 관리 
	@RequestMapping("SeeUser.bjp")
	public ModelAndView SeeUser(ModelAndView mv){
		
		mv.setViewName("bjPayList/SeeUser");
		return mv;
				
	}

	
	//BJ 방송시간 관리
	@RequestMapping("LiveTime.bjp")
	public ModelAndView LiveTime(ModelAndView mv){
		
		mv.setViewName("bjPayList/LiveTime");
		return mv;
				
	}
	
	//BJ 출금 신청하기

	@RequestMapping("WithdrawForm.bjp")
	public ModelAndView WithdrawForm(ModelAndView mv, String mcode){
		System.out.println("WithdrawForm mcode="+mcode);
		
		int peach = bjp.selectPeach(mcode);
		System.out.println(peach);
		
		int wd_price = bjp.selectwdprice(mcode);
		
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("peach", peach);
		hmap.put("wd_price", wd_price);
		
		mv.addObject("hmap", hmap);
		mv.setViewName("bjPayList/WithdrawForm");
		return mv;
				
	}
	
	//BJ 계좌인증 
	@RequestMapping("Account.bjp")
	public ModelAndView Account(ModelAndView mv){
		
		mv.setViewName("bjPayList/Account");
		return mv;
				
	}
	

	//출금신청
	@RequestMapping("WithdrawInsert.bjp")
	public ModelAndView WithdrawInsert(ModelAndView mv, String mcode,String mid, String account, int peach){
		BJPayList bjpvo = new BJPayList();
		bjpvo.setAccount(account);
		bjpvo.setMcode(mcode);
		bjpvo.setPrice(peach*70);
		
		bjp.insertBJPayList(bjpvo);
		
		int peach2 = bjp.selectPeach(mcode);
		System.out.println(peach2);
		
		int wd_price = bjp.selectwdprice(mcode);
		
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("peach", peach2);
		hmap.put("wd_price", wd_price);
		
		mv.addObject("hmap", hmap);
		mv.setViewName("bjPayList/WithdrawForm");
		return mv;
				
	}
	


}
