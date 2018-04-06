package com.kh.mt.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mt.admin.model.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService as;
	
	public AdminController(){}
	
	//관리자 메인화면
	@RequestMapping("adminMain.ad")
	public ModelAndView adminMain(ModelAndView mv){
		
		ArrayList<Integer> list = as.allMenuList();
		
		
		
		
		mv.setViewName("admin/admin");
		
		return mv;
	}
	
	//회원관리 화면
	@RequestMapping("memberMg.ad")
	public ModelAndView memberMg(ModelAndView mv){
		
		mv.setViewName("admin/memberManagement");
		
		return mv;
	}
	
	//수익관리 화면
	@RequestMapping("revenueMg.ad")
	public ModelAndView revenueMg(ModelAndView mv){
		
		mv.setViewName("admin/revenueManagement");
		
		return mv;
	}
	
	//출금신청 화면
	@RequestMapping("withdrawal.ad")
	public ModelAndView withdrawal(ModelAndView mv){
		
		ArrayList<Integer> list = as.allMenuList();
		
		
		
		
		mv.setViewName("admin/withdrawalControl");
		
		return mv;
	}
	
	//출금완료 화면
	@RequestMapping("deposit.ad")
	public ModelAndView deposit(ModelAndView mv){
		
		
		mv.setViewName("admin/depositCompleted");
		
		return mv;
	}
	
	//신고관리 화면
	@RequestMapping("reportMg.ad")
	public ModelAndView reportMg(ModelAndView mv){
		
		mv.setViewName("admin/reportManagement");
		
		return mv;
	}
	
	//문의내역 화면
	@RequestMapping("contactMg.ad")
	public ModelAndView contactMg(ModelAndView mv){
		
		
		mv.setViewName("admin/contactManagement");
		
		return mv;
	}
	
}
