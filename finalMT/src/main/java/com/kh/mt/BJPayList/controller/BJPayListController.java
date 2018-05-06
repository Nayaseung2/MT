package com.kh.mt.BJPayList.controller;

import java.awt.RenderingHints.Key;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
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
import com.kh.mt.member.model.vo.Member;


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
	public ModelAndView BJPayMain(ModelAndView mv, String mcode){
		//아이디 조회  
		//로그기록 조회
		String mId = bjp.SelectMid(mcode);
		File path = new File("C:/Users/sosoc/git/MT/finalMT/src/main/resources/BSLogs/");
		File[] fileList = path.listFiles() ;
		 BufferedReader reader = null;
		 String line = null;
		 int userTotal = 0;
		 int todayTotal = 0;
		 for(int i = 0; i < fileList.length; i++){
			 try {
				 reader = new BufferedReader(new FileReader(fileList[i]));
				 while((line = reader.readLine()) != null){
					 String word1 = line.split("/")[0];
					 String word2 = line.split("/")[1];
					 String word3 = line.split("/")[2];
					 String word4 = line.split("/")[3];
					 System.out.println(word1+"?"+word2+"?"+word3+"?"+word4);


					 if (i==0) {
						 if (mId.equals(word3)) {
							 todayTotal++;
						 }
					 }
					 if (mId.equals(word3)) {
						 userTotal++;
					 }
					


				 }
				 reader.close();
			 } catch (FileNotFoundException e) {
				 // TODO Auto-generated catch block
				 e.printStackTrace();
			 } catch (IOException e) {
				 // TODO Auto-generated catch block
				 e.printStackTrace();
			 }
		 }
		
		//블랙회원수 조회 
		int BlackCount = bjp.SelectCountBlack(mcode);
		
		//출금 완료된 금액
		int wdSuccese = bjp.SelectwdSuccese(mcode);
		
		//출금 신청 진행 중인 금액 
		int wdloding = bjp.Selectwdloding(mcode);
		
		//오늘의 구독자 수
		int MyFanCount = bjp.SelectMyFanCount(mcode);

		//오늘의 수익(피치수)
		int ProfitPeach = bjp.SelectProfitPeach(mcode);
		
		//누적방송시간 
		int time = bjp.SelectLiveTime(mId);
		
		
		mv.addObject("todayTotal", todayTotal);
		mv.addObject("userTotal", userTotal);
		mv.addObject("BlackCount", BlackCount);
		mv.addObject("wdSuccese", wdSuccese);
		mv.addObject("wdloding", wdloding);
		mv.addObject("MyFanCount", MyFanCount);
		mv.addObject("ProfitPeach", ProfitPeach);
		mv.addObject("time", time);
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
		if(pi.getLimit() == 0) {
			mv.setViewName("bjPayList/bjPayMain");
		}else if(pi.getLimit() > 0) {
			
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
		
		if(list == null) {
			return new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		}else if(list!=null) {
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
		return null;
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
		ArrayList<Subscribe> list= bjp.selectMyFanList(mcode);
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
	public ModelAndView LiveTime(ModelAndView mv, String mcode){
		
		//ID 조회
		String mId = bjp.SelectMid(mcode);
		
		// 총방송시간
		int allLiveTime = bjp.SelectAllLiveTime(mId);
		
		// 오늘의 방송시간
		int TodayLiveTime = bjp.SelectTodayLiveTime(mId);
		
		//전낧 방송시간
		int LiveTimeYday = bjp.SelectLiveTimeYday(mId);
		
		// 누적 시청자수
		int allSeeUser  = 0;
		
		// 오늘의 시청자수
		int TodaySeeUser = 0;
		
		// 전날의 시청자수
		int SeeUserY = 0;
		
		//로그기록 조회
		File path = new File("C:/Users/sosoc/git/MT/finalMT/src/main/resources/BSLogs/");
		File[] fileList = path.listFiles() ;
		 BufferedReader reader = null;
		 String line = null;

		 for(int i = 0; i < fileList.length; i++){
			 try {
				 reader = new BufferedReader(new FileReader(fileList[i]));
				 while((line = reader.readLine()) != null){
					 String word1 = line.split("/")[0];
					 String word2 = line.split("/")[1];
					 String word3 = line.split("/")[2];
					 String word4 = line.split("/")[3];
					 System.out.println(word1+"?"+word2+"?"+word3+"?"+word4);


					 if (i==0) {
						 if (mId.equals(word3)) {
							 TodaySeeUser++;
						 }
					 }
					 if (mId.equals(word3)) {
						 allSeeUser++;
					 }
					 if(i==fileList.length-1) {
						 if (mId.equals(word3)) {
							 SeeUserY++;
						 }
					 }
					


				 }
				 reader.close();
			 } catch (FileNotFoundException e) {
				 // TODO Auto-generated catch block
				 e.printStackTrace();
			 } catch (IOException e) {
				 // TODO Auto-generated catch block
				 e.printStackTrace();
			 }
		 }

		
		mv.addObject("allLiveTime", allLiveTime );
		mv.addObject("TodayLiveTime", TodayLiveTime );
		mv.addObject("LiveTimeYday", LiveTimeYday );
		mv.addObject("TodaySeeUser", TodaySeeUser );
		mv.addObject("allSeeUser", allSeeUser );
		mv.addObject("SeeUserY", SeeUserY );
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
	//BJ 계좌인증  Ajax
	@RequestMapping("updateAccount.bjp")
	public ModelAndView updateAccount(ModelAndView mv, String mcode, String account){
		System.out.println(mcode);
		System.out.println(account);
		
		Member m = new Member();
		m.setMcode(mcode);
		m.setAccount(account);
		
		
		int result = bjp.updateAccount(m);
		System.out.println(result);
		
		mv.setViewName("jsonView");
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
