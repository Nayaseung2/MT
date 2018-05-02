package com.kh.mt.liveBJ.controller;

import java.io.File;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.common.LoggerInterceptor;
import com.kh.mt.JDBC.model.vo.JDBC;
import com.kh.mt.JDBC.model.vo.JDBCLogoFile;
import com.kh.mt.board.model.vo.Board;
import com.kh.mt.liveBJ.model.service.LiveBJService;
import com.kh.mt.liveBJ.model.vo.LiveBj;
import com.kh.mt.liveBJ.model.vo.Peach;
import com.kh.mt.member.model.vo.BJBlackMember;
import com.kh.mt.member.model.vo.Member;

@Controller
public class LiveBJFrontController {
	protected Log log = LogFactory.getLog(getClass());
	/*protected Log log = LogFactory.getLog(LoggerInterceptor.class);*/
	@Autowired
	LiveBJService ls;
	
	//시청자가 방의 정보 가저오기
	@RequestMapping(value="JDBCInfo.lb")
	public ModelAndView JDBCInfo(HttpServletRequest request, ModelAndView mv,String href3){
		LiveBj bj = ls.JDBCInfo(href3);
		mv.setViewName("jsonView");
		mv.addObject("bj", bj);
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		String userId = "gost";
			if(loginUser != null){
     		userId = loginUser.getmId();
     	}
		log.debug("id : [" + userId + "] 가 id : ["+ bj.getMid() +"] 방송 [접속]");
		return mv;
	}
	//bj가 자기정보방 가저오기
	@RequestMapping(value="JDBCInfo2.lb")
	public ModelAndView JDBCInfo2(ModelAndView mv,String href3){
		
		LiveBj bj = ls.JDBCInfo2(href3);
		mv.setViewName("jsonView");
		mv.addObject("bj", bj);
		
		return mv;
	}
	
	@RequestMapping(value="testLiveBj.lb")
	public String ChangeView(){
		return "LiveBj/LiveBjPage";
	}
	//방송시작버튼누르면 db에 주소값 저장
	@RequestMapping(value="startBrod.lb")
	public String startBrod(String roomid,String mid){
		System.out.println(roomid);
		System.out.println(mid);
		ls.startBrod(roomid,mid);

		return "성공";
	}
	
	
	//메인페이지에 모든 방송중인 bj불러오기
	@RequestMapping(value="allBJ.lb")
	public ModelAndView allBJ(ModelAndView mv){
		ArrayList<LiveBj> list = ls.allBJ();
		mv.addObject("list",list);
		mv.setViewName("main/main");
		System.out.println(list.size());
		
		return mv;
	}
	
	
	@RequestMapping(value="singo.lb")
	public String Singo(String singoID, String content, String userID){
		ls.singo(singoID, content, userID);
		return "LiveBj/LiveBjPage";
	}
	
	
	// 난수 만들기
	public static String authNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 8; i++) {
			int num = (int) (Math.random() * 9 + 1);
			buffer.append(num);
		}
		return buffer.toString();
	}

	@RequestMapping(value="insertBSCotent.lb")
	public String  insertBSContent(LiveBj bj, Model model,
			@RequestParam(name = "bsImg", required = false) MultipartFile photo, HttpServletRequest request){
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "//bsTitleImages";
		String originalFileName = photo.getOriginalFilename();
		
		// 파일명 변경
		String ext = originalFileName.substring(originalFileName.lastIndexOf('.'));
		String changedName = authNum() + ext;
		try {
			photo.transferTo(new File(filePath + "\\" + changedName));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(bj);
		
		// UPLOADFILE insert
		JDBCLogoFile f = new JDBCLogoFile();
		f.setFrom_code("BSTitleImg");
		f.setF_orname(originalFileName);
		f.setF_rename(changedName);
		f.setFilepath(filePath);
		f.setF_mcode(bj.getMid());
		
		ls.insertBSCotent(bj);
		ls.insertBSTitleImg(f);
		
		
		return "LiveBj/LiveBjPage";
	}
	@RequestMapping(value="peach.lb")
	public ModelAndView updatePeach(ModelAndView mv, String userId, int peachNum, String bjId , HttpServletRequest request){
		System.out.println("1 : "+userId);
		System.out.println("2 : "+peachNum);
		System.out.println("3 : "+bjId);
		Peach p = new Peach();
		p.setBjId(bjId);
		p.setPeachNum(peachNum);
		p.setUserId(userId);
		int result = ls.updatePeach(p);
		System.out.println("lb result ="+result);
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		m.getPeach();
		((Member)session.getAttribute("loginUser")).setPeach(m.getPeach() - peachNum);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="textsingo.lb")
	public ModelAndView insertSingo(ModelAndView mv, String singoja,String singoMem, String singoContent){
		System.out.println("1 : "+singoja);
		System.out.println("2 : "+singoMem);
		System.out.println("3 : "+singoContent);
		Board b = new Board();
		b.setB_title(singoMem);
		b.setB_type("report");
		b.setBwriter(singoja);
		b.setB_content(singoContent);
		int result = ls.insertSingo(b);
		mv.setViewName("jsonView");
		return mv;
	}
	@RequestMapping(value="bjBlackMember.lb")
	public ModelAndView insertBJBlackMember(ModelAndView mv, String adminbj, String blackMember){
		System.out.println("adminbj"+adminbj);
		System.out.println("blackMember"+blackMember);
		
		BJBlackMember bm = new BJBlackMember();
		bm.setBjMember(adminbj);
		bm.setBlackMember(blackMember);
		
		ArrayList bmArr = ls.insertBJBlackMember(bm);
		mv.setViewName("jsonView");
		mv.addObject("bmArr", bmArr);
		return mv;
	}
	
	
	
}
