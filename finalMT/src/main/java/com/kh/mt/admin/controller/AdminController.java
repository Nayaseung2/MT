package com.kh.mt.admin.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mt.admin.model.service.AdminService;
import com.kh.mt.admin.model.vo.Revenue;
import com.kh.mt.admin.model.vo.Withdrawal;
import com.kh.mt.common.PageInfo;
import com.kh.mt.member.model.vo.Member;
import com.kh.mt.pay.model.vo.Pay;

@Controller 
public class AdminController {
	@Autowired
	private AdminService as;
	
	private BufferedReader reader = null;
	
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
		ArrayList<String> times = userCount();
		
		mv.addObject("pi", pi);
		mv.addObject("list", list);
		mv.addObject("mlist", mlist);
		mv.addObject("times", times);
		
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
	
	//그래프 교체용
	@RequestMapping("changeGraph.ad")
	public ModelAndView changeGraph(ModelAndView mv, String type){
		if(type.equals("Time")){
			ArrayList<String> list = userCount();
			
			mv.addObject("list", list);
		}

		if(type.equals("Day")){
			ArrayList<String> list = dayGraph();
			
			mv.addObject("list", list);
		}
		
		if(type.equals("Month")){
			
			ArrayList<String> list = monthGraph();
				
			mv.addObject("list", list);
		}
		
		if(type.equals("reTime")){
			ArrayList<Integer> list = revenueTimeGraph();
			
			mv.addObject("list", list);
		}
		
		if(type.equals("reDay")){
			ArrayList<Integer> list = revenueDayGraph();
			
			mv.addObject("list", list);
		}
		
		if(type.equals("reMonth")){
			ArrayList<Integer> list = revenueMonthGraph();
			
			mv.addObject("list", list);
		}
		
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	//수익관리 화면
	@RequestMapping("revenueMg.ad")
	public ModelAndView revenueMg(ModelAndView mv, String newCurrentPage){
		//전체 값 조회
		HashMap<String, Object> map = new HashMap<String, Object>();
		PageInfo pi = addPage(newCurrentPage, "revenue");
		ArrayList<Revenue> rlist = as.revenueList(pi);
		ArrayList<Pay> plist = as.payList();				//결제 정보
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = sdf.format(new Date());
		
		int day = 0;
		int month = 0;
		int total = 0;
		
		
		for(int i = 0; i < plist.size(); i++){
			if(String.valueOf(plist.get(i).getPay_date()).equals(sysdate)){
				day += plist.get(i).getPrice();
			}
			total += plist.get(i).getPrice();
		}
		
		String[] today = sysdate.split("-");
		String dataDay = "";
		
		for(int i = 0; i < plist.size(); i++){
			dataDay = String.valueOf((plist.get(i).getPay_date())).split("-")[1];
			if(today[1].equals(dataDay)){
				month += plist.get(i).getPrice();
			}
		}
		
		ArrayList<Integer> tlist = revenueTimeGraph(); //시간
		
		map.put("pi", pi);
		map.put("rlist", rlist);
		map.put("tlist", tlist);
		map.put("day", day);
		map.put("month", month);
		map.put("total", total);
		
		mv.addObject("map", map);
		
		if(newCurrentPage == null){
			mv.setViewName("admin/revenueManagement");
		}else {
			mv.setViewName("jsonView");
		}
		
		return mv;
	}
	
//--------------------------------------------------------------------------------------------------------------------------------------------------
	
	//출금신청 화면
	@RequestMapping("withdrawal.ad")
	public ModelAndView withdrawal(ModelAndView mv, String newCurrentPage){
		
		PageInfo pi = addPage(newCurrentPage, "withdrawal");
		
		HashMap<String, Object> map = as.withdrawalList(pi);
		
		map.put("pi", pi);
		mv.addObject("map", map);
		
		mv.setViewName("admin/withdrawalControl");
		
		return mv;
	}
	
	//출금신청 회원조회
	@RequestMapping("searchWithdrawal.ad")
	public ModelAndView searchWithdrawal(ModelAndView mv, String newCurrentPage, String userId){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		PageInfo pi = addUserPage(newCurrentPage, userId);
		ArrayList<Withdrawal> rlist = as.searchWithdrawal(userId, pi);
		
		map.put("rlist", rlist);
		map.put("pi", pi);
		
		mv.addObject("map", map);
		
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	//출금신청 승인
	@RequestMapping("approval.ad")
	public ModelAndView approval(ModelAndView mv, String wdCode){
		
		int approval = 0; 
		approval = as.approval(wdCode);
		
		System.out.println(approval);
		
		mv.setViewName("jsonView");
		
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
	
	//페이징 처리 메소드
	public PageInfo addPage(String newCurrentPage, String type){
		HashMap<String, String> list = as.memberList();
		
		int currentPage = 1;
		int limit = 0;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		int listCount = 0;

		limit = 10;
		
		if(type.equals("member")){
			listCount = Integer.parseInt(String.valueOf(list.get("TOTAL")));
		}else if(type.equals("BJ")){
			listCount = Integer.parseInt(String.valueOf(list.get("BJ")));
		}else if(type.equals("revenue")){
			listCount = Integer.parseInt(String.valueOf(list.get("REVENUE")));
		}else if(type.equals("withdrawal")){
			listCount = Integer.parseInt(String.valueOf(list.get("TODAY")));
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
	
	//유져 페이징 처리
	public PageInfo addUserPage(String newCurrentPage, String userId){
		
		int currentPage = 1;
		int limit = 0;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		int listCount = 0;

		limit = 10;
		
		listCount = as.searchRevenueUser(userId); 
		
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
	
	//회원 관리 시간별 그래프 메소드
	public  ArrayList<String> userCount(){
		HashMap<String, Integer> htemp = new HashMap<String, Integer>();
		ArrayList<String> temp = new ArrayList<String>();
		TreeSet<String> tset = new TreeSet<String>();
		int min = 0;
		int max = 24;
		
		for(int i = min; i < max; i++){
			if(i < 10){
				htemp.put("0"+i, 0);
				tset.add("0"+i);
			}else {
				htemp.put(""+i, 0);
				tset.add(""+i);
			}
		}
		
		try {
			BufferedReader reader = new BufferedReader(new FileReader("C:/Users/JoSeongSik/git/MT/finalMT/src/main/resources/logs/system.log"));
			String line;
			String block;
		
			while((line = reader.readLine()) != null){
				block = line.substring(line.indexOf("[")+1, line.indexOf("]"));
				String[] times = block.split(":");
				
				if(htemp.containsKey(times[0])){
					htemp.put(times[0], htemp.get(times[0])+1);
				}
			}
			
			Iterator<String> it = tset.iterator();
			
			while(it.hasNext()){
				String key = it.next();
				temp.add(String.valueOf(htemp.get(key)));
			}
			
			reader.close();
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		
		return temp;
	}
	
	//회원 관리 일별 그래프 메소드
	public ArrayList<String> dayGraph(){
		BufferedReader reader = null;
		String temp = "";
		String monthDay = as.searchDay();
		String day = (new Date().toString().split(" "))[2];
		ArrayList<String> list = new ArrayList<String>();
		String line = null;
		
		String lastDay = monthDay.substring(monthDay.lastIndexOf("-")+1, monthDay.length());
		String fileName = monthDay.substring(0, monthDay.lastIndexOf("-")+1);
		for(int i = 0; i < Integer.parseInt(lastDay); i++){
			int count = 0;
			
			if(i < 9){
				temp = "0"+(i+1);
			}else {
				temp = ""+(i+1);
			}
			
			try {
				
				if(temp.equals(day)){
					reader = new BufferedReader(new FileReader("C:/Users/JoSeongSik/git/MT/finalMT/src/main/resources/logs/system.log"));
				}else {
					reader = new BufferedReader(new FileReader("C:/Users/JoSeongSik/git/MT/finalMT/src/main/resources/logs/system.log." + fileName + temp));
				}
				
				while((line = reader.readLine()) != null){
					count++;
				}
				
				list.add(String.valueOf(count));
				
			
			} catch (FileNotFoundException e) {
				list.add("0");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	//회원 관리 월별 그래프
	public ArrayList<String> monthGraph(){
		ArrayList<String> list = new ArrayList<String>();
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String temp = "";
		String day = "";
		String line = null;
		String date = sdf.format(d);
		String year = date.substring(0, date.indexOf("-"));
		
		for(int i = 0; i < 12; i++){
			int count = 0;
			if(i < 9){
				temp = year+"-0"+(i+1);
			}else {
				temp = year+"-"+(i+1);
			}
			
			for(int j = 0; j < 31; j++){
				if(j < 9){
					day = "-0"+(j+1);
				}else {
					day = "-"+(j+1);
				}

				try {
					
					if(j == Integer.parseInt(date.substring(date.lastIndexOf("-")+1, date.length()))){
						reader = new BufferedReader(new FileReader("C:/Users/JoSeongSik/git/MT/finalMT/src/main/resources/logs/system.log"));
					}else {
						reader = new BufferedReader(new FileReader("C:/Users/JoSeongSik/git/MT/finalMT/src/main/resources/logs/system.log"+ "." + temp + day));
					}
					
					while((line = reader.readLine()) != null){
						count++;
					}
					
				} catch (FileNotFoundException e) {
					break;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			list.add(String.valueOf(count));
		}
		
		return list;
	}
	
	//수익관리 시간별 그래프
	@RequestMapping("revenueTime.ad")
	public ArrayList<Integer> revenueTimeGraph(){
		ArrayList<Pay> plist = as.payList();
		HashMap<String, Integer> htemp = new HashMap<String, Integer>();
		TreeSet<String> tset = new TreeSet<String>();
		ArrayList<Integer> tlist = new ArrayList<Integer>();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = sdf.format(new Date());
		String[] today = sysdate.split("-");
		
		for(int i = 1; i < 25; i++){
			if(i < 10){
				htemp.put("0"+i, 0);
				tset.add("0"+i);
			}else {
				htemp.put(""+i, 0);
				tset.add(""+i);
			}
		}
		
		String dataDay = "";
		
		for(int i = 0; i < plist.size(); i++){
			String dataHour = plist.get(i).getPay_time().split(":")[0];
			dataDay = String.valueOf((plist.get(i).getPay_date())).split("-")[2];
			
			if(today[2].equals(dataDay)){
				if(htemp.containsKey(dataHour)){
					int result = htemp.get(dataHour).intValue();
					htemp.put(dataHour, result + plist.get(i).getPrice());
				}
			}
		}
		
		Iterator<String> it = tset.iterator();
		while(it.hasNext()){
			String key = it.next();
			tlist.add(htemp.get(key));
		}
		
		return tlist;
	}
	
	//수익관리 일별 그래프
	public ArrayList<Integer> revenueDayGraph(){
		ArrayList<Integer> dlist = new ArrayList<Integer>();
		//오늘 날짜 추출
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String sysdate = sdf.format(new Date());
		String yearAndMonth = sysdate.substring(0, sysdate.lastIndexOf("-"));
		
		//PAYHISTORY 테이블 값 가져오기
		ArrayList<Pay> plist = as.payList();
		
		int result = 0;

		for(int i = 0; i < plist.size(); i++){
			String dataValue = String.valueOf(plist.get(i).getPay_date());
			String temp = dataValue.substring(0, dataValue.lastIndexOf("-"));
			
			if(temp.equals(yearAndMonth)){		//값 비교(년, 월 비교)
				String str = "";
				for(int j = 1; j < 32; j++){	//총 31일 계산
					if(j < 10){
						str = "-0"+j;
					}else {
						str = "-"+j;
					}
					for(int k = i; k < plist.size(); k++){	
						if((temp+str).equals(String.valueOf(plist.get(k).getPay_date()))){ 			//년+월+일 값이 가져온 데이터값의 날짜와 같을때
							result += plist.get(k).getPrice();			//하루치 값 누적
						}
					}
					dlist.add(result);									//하루치 값 추가
					result = 0;											//값 초기화 후 반복
				}
				break;
			}
		}
		return dlist;
	}
	
	//수익관리 월별 그래프
	public ArrayList<Integer> revenueMonthGraph(){
		ArrayList<Integer> mlist = new ArrayList<Integer>(); //값 저장용 변수 선언
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	//날짜 포맷 설정
		String sysdate = sdf.format(new Date());					//오늘 날짜 추출
		String[] extractDate = sysdate.split("-"); 					//년, 월, 일 추출
		
		ArrayList<Pay> plist = as.payList();		//결제 이력 데이터 가져오기
		String temp = "";				//임시변수
		String dataDate = "";			//결제이력 날짜 변수
		String[] extractDataDate;		//결제이력 년, 월, 일 담을 변수
		
		int result = 0;					//총 누적액을 담을 변수
		
		for(int i = 0; i < plist.size(); i++){
			dataDate = String.valueOf(plist.get(i).getPay_date());		//결제 이력의 날짜 가져오기
			extractDataDate = dataDate.split("-");	//년, 월, 일 추출
			
			if(extractDate[0].equals(extractDataDate[0])){			//오늘날짜의 년도와 가져온 데이터의 년도가 같을때
				for(int j = 1; j < 13; j++){	//총 개월수인 12번 반복
					if(j < 10){
						temp = "0" + j;
					}else {
						temp = "" + j;
					}
					for(int k = i; k < plist.size(); k++){	
						if((temp).equals(extractDataDate[1])){ 			//temp로 만든 월과 데이터의 월이 같을때
							result += plist.get(k).getPrice();			//한달치 값 누적
						}
					}
					mlist.add(result);
					result = 0;
				}
				break;
			}
		}
		
		return mlist;
	}
	
	//수익관리 회원 조회
	@RequestMapping("searchRevenue.ad")
	public ModelAndView searchRevenue(ModelAndView mv, String newCurrentPage, String userId){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		PageInfo pi = addUserPage(newCurrentPage, userId);
		ArrayList<Revenue> rlist = as.searchRevenue(userId, pi);
		
		map.put("rlist", rlist);
		map.put("pi", pi);
		
		mv.addObject("map", map);
		
		mv.setViewName("jsonView");
		
		return mv;
	}
	
//	public static void main(String[] args) {
//		int num = 160;
//		String str = "";
//		
//		String temp = "";
//		for(int i = 0; i < str.length(); i++){
//			if(i >= num){
//				temp += str.charAt(i);
//			}
//		}
//		System.out.println(temp);
//	}
	
}
