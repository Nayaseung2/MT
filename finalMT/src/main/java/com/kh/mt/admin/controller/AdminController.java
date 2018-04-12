package com.kh.mt.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.codec.multipart.SynchronossPartHttpMessageReader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mt.admin.model.service.AdminService;
import com.kh.mt.common.PageInfo;
import com.kh.mt.member.model.vo.Member;

@Controller 
public class AdminController {
	@Autowired
	private AdminService as;
	
	public AdminController(){}
	
	//관리자 메인화면
	@RequestMapping("adminMain.ad")
	public ModelAndView adminMain(ModelAndView mv){
		
		HashMap<String, HashMap<String, String>> list = as.allMenuList(); 
		
		//System.out.println("controller list: " + list);
		 
		mv.addObject("list", list);
		
		mv.setViewName("admin/admin");
		
		return mv;
	}
	
	//회원관리 화면
	@RequestMapping("memberMg.ad")
	public ModelAndView memberMg(ModelAndView mv, String newCurrentPage){
		HashMap<String, HashMap<String, String>> list = as.memberList();
		
		System.out.println(list.get("list").values());
		
		PageInfo pi = addPage(newCurrentPage); 
		
		ArrayList<Member> mlist = as.userAllList(pi);
		
		
		System.out.println("controller mlist: " + mlist);
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.addObject("mlist", mlist);
		
		mv.setViewName("admin/memberManagement");
		
		if(newCurrentPage != null){
			
			mv.clear();
			HashMap hMap = new HashMap();
			
			hMap.put("mlist", mlist);
			hMap.put("pi", pi);
			
			mv.addObject("list", hMap);
			
			System.out.println(hMap);
			mv.setViewName("jsonView");
			
			return mv;
		}
		
		System.out.println(mv.getViewName());
		
		return mv;
	}
	
	//방송중인 BJ List조회
	@RequestMapping("searchBJ.ad")
	public ModelAndView searchBJ(ModelAndView mv, String newCurrentPage){
		
		PageInfo pi = addPage(newCurrentPage);
		
		ArrayList<Member> BJList = as.searchBJ(pi);
		
		System.out.println("controller BJ: " + BJList);
		
		HashMap list = new HashMap();
		
		list.put("pi", pi);
		list.put("mlist", BJList);
		
		mv.addObject("list", list);
		
		mv.setViewName("jsonView");
		
		System.out.println("searchBJ 종료");
		
		return mv;
	}
	
	//아이디로 회원 조회
	@RequestMapping("searchMember.ad")
	public ModelAndView searchMember(ModelAndView mv, String search){
		
		Member m = as.searchMember(search);
		
		mv.addObject("m", m);
		
		mv.setViewName("jsonView");

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
	
		
	public PageInfo addPage(String newCurrentPage){
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		int listCount;

		currentPage = 1;
		
		limit = 2;
		
		if(newCurrentPage != null){
			currentPage = Integer.parseInt(newCurrentPage);
		}
		
		listCount = as.mlistCount();
		
		maxPage = (int)((double)listCount / limit + 0.9);
		
		startPage = ((int)((double)currentPage / limit + 0.9)-1) * limit + 1;
		
		endPage = startPage + limit -1;
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		return new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
	}
	
}
