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
	
	//관리 메인화면용 메소드
	@RequestMapping("adminMain.ad")
	public ModelAndView adminMain(ModelAndView mv){
		
		ArrayList<Integer> list = as.allMenuList();
		
		
		
		
		mv.setViewName("main/main");
		
		return mv;
	}
	
	
}
