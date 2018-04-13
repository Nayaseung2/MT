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
		
		mv.addObject("list", list);
		
		mv.setViewName("admin/admin");
		
		return mv;
	}
	
	//회원관리 화면
	@RequestMapping("memberMg.ad")
	public ModelAndView memberMg(ModelAndView mv, String newCurrentPage){
		HashMap<String, String> list = as.memberList();
		
		PageInfo pi = addPage(newCurrentPage, "member"); 
		
		ArrayList<Member> mlist = as.userAllList(pi);
		
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
		
		
		return mv;
	}
	
	//방송중인 BJ List조회
	@RequestMapping("searchBJ.ad")
	public ModelAndView searchBJ(ModelAndView mv, String newCurrentPage){
		
		
		PageInfo pi = addPage(newCurrentPage, "BJ");
		
		ArrayList<Member> BJList = as.searchBJ(pi);
		
		HashMap list = new HashMap();
		
		list.put("pi", pi);
		list.put("mlist", BJList);
		
		mv.addObject("list", list);
		
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	//아이디로 회원 조회
	@RequestMapping("searchMember.ad")
	public ModelAndView searchMember(ModelAndView mv, String userId){
		
		Member m = as.searchMember(userId);
		
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
	
		
	public PageInfo addPage(String newCurrentPage, String type){
		HashMap<String, String> list = as.memberList();
		
		int currentPage = 1;
		int limit = 0;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		int listCount = 0;

		limit = 2;
		
		if(type.equals("member")){
			listCount = Integer.parseInt(String.valueOf(list.get("TOTAL")));
		}else if(type.equals("BJ")){
			listCount = Integer.parseInt(String.valueOf(list.get("BJ")));
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
	
}
