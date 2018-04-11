package com.kh.mt.JDBC.controller;

import java.io.File;
import java.io.IOException;

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

@Controller
public class JDBCController {
	@Autowired
	JDBCService js;
	
	//메인에서 방송국 페이지로 가기
	@RequestMapping(value="showJDBCPage.JDBC")
	public String showJDBCPage() {
		
		return "JDBC/myBroadcastStation";
	}
	
	//방송국-관리로 가기
	@RequestMapping(value="showBSmanage.JDBC")
	public String showBSmanage() {
		
		return "JDBC/BSmanage";
	}
	
	//방송국 정보 insert
	@RequestMapping(value="insertJDBCstation.JDBC")
	public String insertJDBCstation(JDBC j, Model model,@RequestParam(name="jdbcLogo",required=false)MultipartFile photo,HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\jdbcStationFileLogo";
		String originalFileName=photo.getOriginalFilename();
		try {
			photo.transferTo(new File(filePath + "\\" + photo.getOriginalFilename()));
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//방송국 정보가 있는지 없는지 체크
		JDBC getInfo=null;
		getInfo=js.selectJDBCstation(j);
		
		if(getInfo==null){
			js.insertJDBCstation(j);
		}else{
			js.updateJDBCstation(j);
		}
		JDBC getInfo1=null;
		getInfo1=js.selectJDBCstation(j);
		HttpSession session = request.getSession();
		session.setAttribute("jdbcInfo", getInfo1);
		return "JDBC/myBroadcastStation";
	}
	
}
