package com.kh.mt.helpcenter.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mt.board.model.vo.BoardFile;
import com.kh.mt.common.PageInfo;
import com.kh.mt.helpcenter.model.sevice.HelpService;
import com.kh.mt.helpcenter.model.vo.HelpMainVo;
import com.kh.mt.member.model.vo.Member;
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
		//System.out.println("controller: " + mv.getViewName());
		//System.out.println("list: " + list);

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
	
	// 신고대상 아이디 체크
	@RequestMapping("bullyIdCheck.hp")
	public void bullyIdCheck(HttpServletResponse response, String bullyId) {
		
		response.setContentType("text/html; charset=utf-8");
		
		String userId = hs.bullyIdCheck(bullyId);
		
		try {
			
			if(bullyId.equals(userId)){
				
				response.getWriter().print("신고대상 아이디 체크를 완료했습니다.");
			
			}else{
				
				response.getWriter().print("일치하는 회원 아이디가 존재하지 않습니다.");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	// 신고하기 등록하면 등록완료 페이지 이동
	@RequestMapping(value="helpreportpost.hp")
	public String showHelpCenterReportPost(String mId, String bullyId, String rContent,
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

		String rename = onlyFileName + "_" + getCurrentDayTime() + (int)((Math.random()* 100)+1) + extension;

		//System.out.println("controller's rename : " + rename);
		
		try {

			photo.transferTo(new File(filePath + "\\" + rename));

		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		// 사진 끝

		try {

			HelpMainVo hm = new HelpMainVo();
			hm.setBwriter(mId);
			hm.setB_title(bullyId);	// 신고일 경우 게시글 제목 대신 신고대상 아이디
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
	public ModelAndView showHelpCenterAnswer(ModelAndView mv, String mId, String qType, String qTitle, String qContent) {

		//System.out.println("controller's mId/qType/qTitle/qContent : " + mId + "/" + qType + "/" + qTitle + "/" + qContent);

		mv.setViewName("helpcenter/helpAnswer");

		HelpMainVo hm = new HelpMainVo();
		hm.setBwriter(mId);
		hm.setB_type("personal/" + qType);
		hm.setB_title(qTitle);
		hm.setB_content(qContent);

		hs.personal(hm);

		return mv;
	}

	// 메뉴바에서 고객센터 공지사항으로 페이지 이동(=공지글 목록)
	@RequestMapping(value="helpnotice.hp")
	public ModelAndView showHelpCenterNotice(ModelAndView mv, String newCurrentPage) {
		
		PageInfo pi = addPage(newCurrentPage);
		
		ArrayList<HelpMainVo> nList = hs.nList(pi);
		
		//System.out.println("controller's pi : " + pi);
		
		HashMap hmap = new HashMap();
		
		hmap.put("pi", pi);
		hmap.put("nList", nList);
		
		mv.addObject("hmap", hmap);
		
		if(newCurrentPage == null) {
			mv.setViewName("helpcenter/helpNotice");
		}else {
			mv.setViewName("jsonView");
		}

		return mv; 
	}

	//페이징 처리 메소드
	public PageInfo addPage(String newCurrentPage){
		
		int currentPage = 1;
		int limit = 0;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		int listCount = 0;

		limit = 10;

		listCount = hs.nListTotal();

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

	// 공지글 상세보기
	@RequestMapping(value="helpnoticedetail.hp")
	public ModelAndView showHelpCenterNoticeDetail(ModelAndView mv, String b_code) {

		mv.setViewName("helpcenter/helpNoticeDetail");

		ArrayList<HelpMainVo> nListDetail = hs.nListDetail(b_code);

		mv.addObject("nListDetail", nListDetail);

		return mv;
	}





}
