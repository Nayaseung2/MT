package com.kh.mt.helpcenter.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mt.board.model.vo.BoardFile;
import com.kh.mt.helpcenter.model.sevice.HelpService;
import com.kh.mt.helpcenter.model.sevice.HelpServiceImpl;
import com.kh.mt.helpcenter.model.vo.HelpMainVo;
import com.kh.mt.member.model.vo.Member;
import com.kh.mt.pay.model.vo.Pay;
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
		
		//System.out.println("controller's search word : " + word);
		
		mv.setViewName("helpcenter/helpSearch");
		
		ArrayList<HelpMainVo> sList = hs.sList(word);
		
		mv.addObject("sList", sList);
		
		return mv;
		
	}
	
	// 메뉴바에서 고객센터 신고하기로 페이지 이동
	@RequestMapping(value="helpreport.hp")
	public String showHelpCenterReport() {
	
		return "helpcenter/helpReport";
	}
	
	// 신고하기 등록하면 등록완료 페이지 이동
	@RequestMapping(value="helpreportpost.hp")
	public String showHelpCenterReportPost(String mId, String rTitle, String rContent,
						 				Model model, MultipartFile photo, HttpServletRequest request) {
		
		//System.out.println("controller's mId/rTitle/rContent : " + mId + "/" + rTitle + "/" + rContent);
		
		// 사진 시작
		// 사진이 저장된 루트 주소
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 사진을 저장 할 주소
		String filePath = root + "\\uploadFiles";
		
		// 사진 rename위한 확장자 분리 후 저장
		String onlyFileName = photo.getOriginalFilename().substring(0, photo.getOriginalFilename().indexOf(".")); // fileName
	    String extension = photo.getOriginalFilename().substring(photo.getOriginalFilename().indexOf(".")); // .jpg
	     
	    String rename = onlyFileName + "_" + getCurrentDayTime() + extension;
		
		try {
			
			photo.transferTo(new File(filePath + "\\" + photo.getOriginalFilename()));
			
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		// 사진 끝
		
		try {

			HelpMainVo hm = new HelpMainVo();
			hm.setBwriter(mId);
			hm.setB_title(rTitle);
			hm.setB_content(rContent);
			// b_type은 report로
			
			hs.report(hm);
			
			BoardFile bf = new BoardFile();
			bf.setF_orname(photo.getOriginalFilename());
			bf.setF_rename(rename);
			bf.setFilepath(filePath);
			bf.setF_mcode(mId);
			// from code에 b_code..? b_type을 넣기엔 별루...
			
			hs.reportFile(bf);
			
			return "helpcenter/helpReportPost";
			
		}catch(RuntimeException e){ //따로 spring에서 발생하여 여기서 수작업으로 잡아야줘야한다.
			
			return "helpcenter/helpReport";
		}
		
	}
	
	// 이미지 rename용 
	public String getCurrentDayTime(){
	    long time = System.currentTimeMillis();
	    SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
	    return dayTime.format(new Date(time));
	}
	
	// 메뉴바에서 고객센터 1:1문의로 페이지 이동
	@RequestMapping(value="helppersonal.hp")
	public String showHelpCenterPersonal() {
		
		return "helpcenter/helpPersonal";
	}
	
	// 1:1문의 등록
	@RequestMapping(value="helpanswer.hp")
	public ModelAndView showHelpCenterAnswer(ModelAndView mv, String mId, String qTitle, String qContent) {
		
		//System.out.println("controller's mId/qTitle/qContent : " + mId + "/" + qTitle + "/" + qContent);
		
		mv.setViewName("helpcenter/helpAnswer");
		
		HelpMainVo hm = new HelpMainVo();
		hm.setBwriter(mId);
		hm.setB_title(qTitle);
		hm.setB_content(qContent);
		
		hs.personal(hm);
						
		return mv;
	}
	
	// 메뉴바에서 고객센터 공지사항으로 페이지 이동(=공지글 목록)
	@RequestMapping(value="helpnotice.hp")
	public ModelAndView showHelpCenterNotice(ModelAndView mv) {
		
		mv.setViewName("helpcenter/helpNotice");
		
        ArrayList<HelpMainVo> nList = hs.nList();

        mv.addObject("nList", nList);
        
        return mv; 
	}
	
	/*// 공지글 목록
	@RequestMapping(value="helpnoticedetail.hp")
	public ModelAndView showHelpCenterNoticeDetail(ModelAndView mv) {
		
		mv.setViewName("helpcenter/helpNoticeDetail");
		
        ArrayList<HelpMainVo> nList = hs.nList();

        mv.addObject("nList", nList);
        
        return mv; 
		
	}*/
	
	// 공지글 상세보기
	@RequestMapping(value="helpnoticedetail.hp")
	public String showHelpCenterNoticeDetail() {
		
		return "helpcenter/helpNoticeDetail";
	}
	
	
	
	
	
}
