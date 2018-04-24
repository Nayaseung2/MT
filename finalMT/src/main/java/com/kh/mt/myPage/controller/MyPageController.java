package com.kh.mt.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mt.member.model.vo.Member;
import com.kh.mt.myPage.model.service.MyPageService;

@Controller
@SessionAttributes("loginUser")
public class MyPageController {
	
	@Autowired
	private MyPageService ms;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	// 마이페이지 입장
	@RequestMapping(value="myPageEntry.mp")
	public String showMyPage() {

		return "myPage/myPageEntry";
	}
	
	// 비밀번호 확인
	@RequestMapping(value="pwdCheck.mp")
	public ModelAndView showMyPageMain(ModelAndView mv, HttpServletResponse response, String mPwd, String inputPwd) {

		response.setContentType("text/html; charset=utf-8");
		
		//System.out.println("controller's mPwd : " + mPwd);
		//System.out.println("controller's inputPwd : " + inputPwd);
		
		//System.out.println("matches : " + passwordEncoder.matches(inputPwd, mPwd));
		
		if(passwordEncoder.matches(inputPwd, mPwd) == true) {
			
			mv.addObject("success");
			
		} else {
			
			mv.addObject("false");
		}
		
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	// 마이페이지 메인
	@RequestMapping(value="myPageMain.mp")
	public String showMyPageMain() {

		return "myPage/myPageMain";
	}
	
	
	// 닉네임 변경
	/*@RequestMapping(value="changeNick.mp")
	public ModelAndView changeNick(ModelAndView mv, String nickName) {
		
		System.out.println("controller's changeNick : " + nickName);
		
		mv.setViewName("myPage/myPageMain");
		
		Member m =  new Member();
		m.setNickName(nickName);
		
		ms.changeNick(m);
		
		return mv;
	}*/
	
	// 닉네임 중복확인
	@RequestMapping(value="overlapCheck.mp")
	public ModelAndView overlapCheck(HttpServletResponse response, ModelAndView mv, String mId, String nickName) {
		
		response.setContentType("text/html; charset=utf-8");
		
		String DBnickName = ms.overlapCheck(nickName);
		
			try {
				
				if(nickName.equals(DBnickName)){
					
					mv.addObject("false");
					response.getWriter().print("중복되는 닉네임이 있습니다. 다른 닉네임을 입력해주세요.");
					
				}else{
					
					mv.addObject("success");
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	// 닉네임 변경
	@RequestMapping(value="changeNick.mp")
	public ModelAndView changeNick(ModelAndView mv, SessionStatus status, HttpServletRequest request,
			 						String mId, String nickName) {
		
		System.out.println("controller's mId/nickName : " + mId + "/" + nickName);
		
		
		
		// 파라미터 꺼내와서 변수에 저장
		/*String mName =request.getParameter("mName");
		String email = request.getParameter("email");
		String joinDate = request.getParameter("joinDate");*/
		
		// 멤버객체 만들어서 set으로 필드값변경
		Member m = new Member();
		m.setmId(mId);
		/*m.setmName(mName);*/
		m.setNickName(nickName);
		/*m.setEmail(email);
		m.setJoinDate(joinDate);*/
		request.setAttribute("member", m);
		
		ms.changeNick(m);
		
		HttpSession session = request.getSession();
		session.setAttribute("nickName", nickName);
		
		mv.setViewName("myPage/myPageMain");
		
		return mv;
	}
	
	// 비밀번호 변경
	@RequestMapping(value="changePwd.mp")
	public ModelAndView changePwd(ModelAndView mv, SessionStatus status, HttpServletRequest request,
			 						Member m, String mId, String newPwd1) {
		
		System.out.println("controller's mId/newPwd1 : " + mId + "/" + newPwd1);
		
		m.setmId(mId);
		m.setmPwd(passwordEncoder.encode(newPwd1));
		
		ms.changePwd(m);
		
		/*HttpSession session = request.getSession();
		session.setAttribute("newPwd1", newPwd1);*/
		
		mv.setViewName("myPage/myPageMain");
		
		return mv;
	}
	
	// 탈퇴 후 사이트 메인페이지로 가기
	@RequestMapping(value="showMain.mp")
	public String showshowMainPage(SessionStatus status) {
		
		status.setComplete();
		
		return "main/main";
	}
	
	
}
