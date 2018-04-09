package com.kh.mt.helpcenter.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mt.helpcenter.model.sevice.HelpService;
import com.kh.mt.helpcenter.model.sevice.HelpServiceImpl;
import com.kh.mt.helpcenter.model.vo.HelpMainVo;
@Controller
public class HelpController {
	@Autowired
	private HelpService hs = new HelpServiceImpl();
	// 메뉴바에서 고객센터 메인(=자주묻는질문)으로 페이지 이동
	@RequestMapping(value="helpmain.hp")
	public String showHelpCenterMain() {
	
		return "helpcenter/helpMain";
	}
	
	// 메뉴바에서 고객센터 1:1문의로 페이지 이동
	@RequestMapping(value="helppersonal.hp")
	public String showHelpCenterPersonal() {
	
		return "helpcenter/helpPersonal";
	}
	
	// 메뉴바에서 고객센터 공지사항으로 페이지 이동
	@RequestMapping(value="helpnotice.hp")
	public String showHelpCenterNotice() {
	
		return "helpcenter/helpNotice";
	}
	
	// 메뉴바에서 고객센터 신고하기로 페이지 이동
	@RequestMapping(value="helpreport.hp")
	public String showHelpCenterReport() {
	
		return "helpcenter/helpReport";
	}
	
	// 1:1문의 등록하면 등록완료 페이지 이동
	@RequestMapping(value="helpanswer.hp")
	public String showHelpCenterAnswer() {
	
		return "helpcenter/helpAnswer";
	}
	
	// 공지사항 게시글 클릭시 상세 페이지 이동
	@RequestMapping(value="helpnoticedetail.hp")
	public String showHelpCenterNoticeDetail() {
	
		return "helpcenter/helpNoticeDetail";
	}
	
	//sdf
	// 01. 게시글 목록
    @RequestMapping("list.do")
    public ModelAndView list(ModelAndView mav) throws Exception{
        ArrayList<HelpMainVo> list = hs.listAll();
        // ModelAndView - 모델과 뷰
        mav.setViewName("board/list"); // 뷰를 list.jsp로 설정
        mav.addObject("list", list); // 데이터를 저장
        return mav; // list.jsp로 List가 전달된다.
    }
	
	
	
	
	
	
	
	
	
	
	
	
}
