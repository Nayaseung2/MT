package com.kh.mt.BJPayList.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BJPayListController {
	
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
	public ModelAndView ProfitBj(ModelAndView mv){
		
		mv.setViewName("bjPayList/ProfitBj");
		return mv;
				
	}
	
	//.BJ 방송 블랙 회ㅏ원 관리
	@RequestMapping("BlackList.bjp")
	public ModelAndView BlackList(ModelAndView mv){
		
		mv.setViewName("bjPayList/BlackList");
		return mv;
				
	}
	
	//BJ 팬 관리 페이지
	@RequestMapping("MyFan.bjp")
	public ModelAndView MyFan(ModelAndView mv){
		
		mv.setViewName("bjPayList/MyFan");
		return mv;
				
	}
	
	//BJ 출금 관리 페이지
	@RequestMapping("WithdrawList.bjp")
	public ModelAndView WithdrawList(ModelAndView mv){
		
		mv.setViewName("bjPayList/WithdrawList");
		return mv;
				
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
	public ModelAndView WithdrawForm(ModelAndView mv){
		
		mv.setViewName("bjPayList/WithdrawForm");
		return mv;
				
	}
	
	//BJ 계좌인증 
	@RequestMapping("Account.bjp")
	public ModelAndView Account(ModelAndView mv){
		
		mv.setViewName("bjPayList/Account");
		return mv;
				
	}


}
