package com.kh.mt.JDBC.controller;

import java.io.File;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.mt.JDBC.model.service.JDBCService;
import com.kh.mt.JDBC.model.vo.JDBC;
import com.kh.mt.JDBC.model.vo.JDBCInfo;
import com.kh.mt.JDBC.model.vo.JDBCLogoFile;
import com.kh.mt.common.PageInfo;
import com.kh.mt.liveBJ.model.vo.Gudock;
import com.kh.mt.member.model.vo.Member;

@Controller
public class JDBCController {
	@Autowired
	JDBCService js;

	//2018.04.13
	// 방명록 목록
	@RequestMapping(value = "showGuestBookList.JDBC")
	public String showGuestBookList() {
		return "JDBC/BSGuestBookList";
	}
	
	
	//
	//menubar에서 방송국 가기 눌렀을 때 정보 불러오기
	@RequestMapping(value = "bringJDBC.JDBC")
	public String bringJDBC(HttpServletRequest request) {
		//방송국 정보 불러오기
		String mId= request.getParameter("mId");
		JDBC j = js.selectForShow(mId);
		
		//방송국 로고 파일 불러오기
		JDBCLogoFile f = new JDBCLogoFile();
		f=js.selectJDBCLogoForShow(mId);
		
		HttpSession session = request.getSession();
		session.setAttribute("jdbcInfo", j);
		if(f!=null){
			System.out.println("controller f : "+f);
			session.setAttribute("jdbcLogoFile", f);
		}
		return "JDBC/myBroadcastStation";
	}
	
	@RequestMapping(value = "bjJDBC.JDBC")
	public String bjJDBC(String mid, Model model, HttpServletRequest request) {
		//방송국 정보 불러오기
		
		JDBC j = js.selectForShow(mid);
		HashMap<Integer,ArrayList<JDBCInfo>> gu = js.selectGudock(mid);
		model.addAttribute("Gudock", gu);
		System.out.println("gu"+gu);
		Member m = new Member();
		String nickName = js.selectNickName(mid);
		m.setNickName(nickName);
		//방송국 로고 파일 불러오기
		JDBCLogoFile f = new JDBCLogoFile();
		f=js.selectJDBCLogoForShow(mid);
		
		//session.setAttribute("jdbcInfo", j);
		HttpSession session = request.getSession();
		session.setAttribute("jdbcInfo", j);
		
		model.addAttribute("m", m);
		model.addAttribute("jdbcInfo", j);
		if(f!=null){
			//System.out.println("controller f : "+f);
			//model.addAttribute("jdbcLogoFile", f);
			session.setAttribute("jdbcLogoFile", f);
		}
		return "JDBC/myBroadcastStation";
	}

	// 방송국-관리로 가기
	@RequestMapping(value = "showBSmanage.JDBC")
	public String showBSmanage() {

		return "JDBC/BSmanage";
	}

	// 방송국-글쓰기로 가기
	@RequestMapping(value = "JDBCwrite.JDBC")
	public String JDBCwrite() {
		return "JDBC/BSwrite";
	}
	
	// 방송국-글쓰기 완료
	@RequestMapping(value = "BSwriteSuccess.JDBC")
	public String JDBCwriteSuccess() {
		return "JDBC/BSwriteSuccess";
	}
	
	// 방송국 메인
	@RequestMapping(value = "myBroadcastStation.JDBC")
	public String JDBCmain() {
		return "JDBC/myBroadcastStation";
	}

	// 방송국-내 게시판 목록
	@RequestMapping(value = "BSmyBoard.JDBC")
	public String showBSmyBoard() {
		return "JDBC/BSmyBoard";
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

	// 방송국 정보 insert
	@RequestMapping(value = "insertJDBCstation.JDBC")
	public String insertJDBCstation(JDBC j, Model model,
			@RequestParam(name = "jdbcLogo", required = false) MultipartFile photo, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\jdbcStationFileLogo";
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

		// UPLOADFILE insert
		JDBCLogoFile f = new JDBCLogoFile();
		f.setFrom_code("JDBCLogo");
		f.setF_orname(originalFileName);
		f.setF_rename(changedName);
		f.setFilepath(filePath);
		f.setF_mcode(j.getMid());
		
		//방송국에 insert
		JDBCLogoFile f1 = null;
		f1=js.selectJDBCLogo(f);
		if(f1==null){
			js.insertJDBCLogoFile(f);
		}else{
			js.updateJDBCLogoFile(f);
		}
		
		// 방송국 정보가 있는지 없는지 체크
		JDBC getInfo = null;
		getInfo = js.selectJDBCstation(j);

		if (getInfo == null) {
			js.insertJDBCstation(j);
		} else {
			js.updateJDBCstation(j);
		}
		//방송국 정보 update
		js.updateJDBCstation(j);
		JDBC getInfo1 = null;
		getInfo1 = js.selectJDBCstation(j);
		HttpSession session = request.getSession();
		session.setAttribute("jdbcInfo", getInfo1);
		
		//파일 세션에 올리기
		JDBCLogoFile f2 = null;
		f2=js.selectJDBCLogo(f);
		session.setAttribute("jdbcLogoFile", f2);
		return "JDBC/myBroadcastStation";
	}
	//방송하러 가기 
	@RequestMapping(value = "bangsonggo.JDBC")
	public String bangsonggo(){
		return "JDBC/BangsongGo";
	}
	
	//페이징처리
	public PageInfo addUserPage(String newCurrentPage, int count){
		
		int currentPage = 1;
		int limit = 0;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		int listCount = 0;

		limit = 10;
		
		listCount = count; 
		
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
