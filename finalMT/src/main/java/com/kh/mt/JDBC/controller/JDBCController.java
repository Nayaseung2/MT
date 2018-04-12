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
import com.kh.mt.JDBC.model.vo.JDBCLogoFile;
import com.kh.mt.member.model.vo.Member;

@Controller
public class JDBCController {
	@Autowired
	JDBCService js;

	// 메인에서 방송국 페이지로 가기 정보 없으면
	/*@RequestMapping(value = "showJDBCPage.JDBC")
	public String showJDBCPage() {
		System.out.println("정보 없음 ");
		return "JDBC/myBroadcastStation";
	}*/
	
	//menubar에서 방송국 가기 눌렀을 때 정보 불러오기
	@RequestMapping(value = "bringJDBC.JDBC")
	public String bringJDBC(HttpServletRequest request) {
		String mId= request.getParameter("mId");
		JDBC j = js.selectForShow(mId);
		HttpSession session = request.getSession();
		session.setAttribute("jdbcInfo", j);
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
		JDBC getInfo1 = null;
		getInfo1 = js.selectJDBCstation(j);
		System.out.println("Controller getInfo1 : "+getInfo1);
		HttpSession session = request.getSession();
		session.setAttribute("jdbcInfo", getInfo1);
		return "JDBC/myBroadcastStation";
	}

}
