package com.kh.mt.liveBJ.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mt.JDBC.model.vo.JDBC;
import com.kh.mt.JDBC.model.vo.JDBCLogoFile;
import com.kh.mt.liveBJ.model.service.LiveBJService;
import com.kh.mt.liveBJ.model.vo.LiveBj;

@Controller
public class LiveBJFrontController {
	@Autowired
	LiveBJService ls;
	
	//
	public ModelAndView WatchView(ModelAndView mv,HttpServletRequest request,HttpServletRequest response){
		String title = request.getParameter("title");
		String href = request.getParameter("href");
		String nick = request.getParameter("nick");
		String content = request.getParameter("content");
		
		System.out.println(title);
		System.out.println(href);
		System.out.println(nick);
		System.out.println(content);
		
		request.setAttribute("title", title);
		request.setAttribute("href", href);
		request.setAttribute("nick", nick);
		request.setAttribute("content", content);
		
		try {
			request.getRequestDispatcher("https://localhost:8034/mt/insertBSCotent.lb#"+href).forward(request, (ServletResponse) response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
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
}
