package com.kh.mt.helpcenter.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mt.helpcenter.model.sevice.HelpService;
import com.kh.mt.helpcenter.model.sevice.HelpServiceImpl;
import com.kh.mt.helpcenter.model.vo.HelpMainVo;
@Controller
public class HelpController {
	
	@Autowired
	private HelpService hs;
	
	
	// 고객센터 메인화면(=자주묻는 질문)
	@RequestMapping(value="helpmain.hp")
	public @ResponseBody ModelAndView showHelpCenterMain(ModelAndView mv, String b_type) throws Exception{
		
		mv.setViewName("helpcenter/helpMain");
		
		if(b_type != null) {
			mv.setViewName("jsonView");
		}
		
		if(b_type == null) {
			b_type = "qna1";
		} 
		
        ArrayList<HelpMainVo> list = hs.listAll(b_type);

        mv.addObject("list", list);
        
        return mv; 
    }
	
	// 자주묻는질문에서 검색
	@RequestMapping(value="helpsearch.hp")
	public ModelAndView showHelpCenterSearch(ModelAndView mv, String word) {
		
		mv.setViewName("helpcenter/helpSearch");
		
		ArrayList<HelpMainVo> sList = hs.sList(word);
		
		mv.addObject("sList", sList);
		
		return mv;
		
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
	
	

	
	
	
	
	
	
	
	
	
	
}
