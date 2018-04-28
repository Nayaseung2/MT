package com.kh.mt.myPage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

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

import com.kh.mt.board.model.vo.Board;
import com.kh.mt.common.PageInfo;
import com.kh.mt.helpcenter.model.vo.HelpMainVo;
import com.kh.mt.member.model.vo.Member;
import com.kh.mt.myPage.model.service.MyPageService;
import com.kh.mt.reply.model.vo.ReplyVo;

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
	
	// 마이페이지 선택화면
	@RequestMapping(value="myPageChoise.mp")
	public String showMyPageChoise() {

		return "myPage/myPageChoise";
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
	
	
	
	// 마이페이지 질문 리스트
	@RequestMapping(value="myPageList.mp")
	public ModelAndView showMyPageList(ModelAndView mv, String newCurrentPage,
										String mId) {
		
		PageInfo pi = addPage(newCurrentPage, mId);
		
		ArrayList<Board> pList = ms.pList(pi, mId);
		
		//System.out.println("controller's pi : " + pi);
		
		HashMap hmap = new HashMap();
		
		hmap.put("pi", pi);
		hmap.put("pList", pList);
		
		mv.addObject("hmap", hmap);
		
		if(newCurrentPage == null) {
			mv.setViewName("myPage/myPageList");
		}else {
			mv.setViewName("jsonView");
		}

		return mv; 
	}
	
	// 마이페이지 답변보기
	@RequestMapping(value="myPageListAnswer.mp")
	public ModelAndView showMyPageListAnswer(ModelAndView mv, String b_code) {

		
		//System.out.println("controller b_code: " + b_code);
		
		ArrayList<ReplyVo> paList = ms.paList(b_code);
		
		//System.out.println("controller's paList : " + paList);
	
		HashMap<String, Object> hmap = new HashMap<>();
		
		hmap.put("paList", paList);
		
		mv.addObject("hmap", hmap);

		mv.setViewName("jsonView");
		
		return mv;
	}
	
	//페이징 처리 메소드
	public PageInfo addPage(String newCurrentPage, String mId){
		
		int currentPage = 1;
		int limit = 0;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		int listCount = 0;

		limit = 10;

		listCount = ms.pListTotal(mId);

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
	

	
	
	
	
	
	
	
	
	
	
	
	/*======================================*/
	
	
	
	// 마이페이지 메인
	@RequestMapping(value="myPageMain.mp")
	public String showMyPageMain() {

		return "myPage/myPageMain";
	}
	
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
		
		Member m = new Member();
		m.setmId(mId);
		m.setNickName(nickName);
		
		ms.changeNick(m);
		
		HttpSession session = request.getSession();
		((Member)session.getAttribute("loginUser")).setNickName(nickName);
		
		mv.setViewName("myPage/myPageMain");
		
		return mv;
	}
	
	// 비밀번호 변경
	@RequestMapping(value="changePwd.mp")
	public ModelAndView changePwd(ModelAndView mv, SessionStatus status, HttpServletRequest request,
			 						Member m, String mId, String newPwd1) {
		
		//System.out.println("controller's mId/newPwd1 : " + mId + "/" + newPwd1);
		
		m.setmId(mId);
		m.setmPwd(passwordEncoder.encode(newPwd1));
		
		ms.changePwd(m);
		
		HttpSession session = request.getSession();
		((Member)session.getAttribute("loginUser")).setmPwd(passwordEncoder.encode(newPwd1));
		
		mv.setViewName("myPage/myPageMain");
		
		return mv;
	}
	
	// 탈퇴 후 사이트 메인페이지로 가기
	@RequestMapping(value="withdraw.mp")
	public ModelAndView withdraw(SessionStatus status, ModelAndView mv, String mId) {
		
		//System.out.println("controller's mId : " + mId);
		
		ms.withdraw(mId);
		
		status.setComplete();
		
		mv.addObject("success");
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	
}
