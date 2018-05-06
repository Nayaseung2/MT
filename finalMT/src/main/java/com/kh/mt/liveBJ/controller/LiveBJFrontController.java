package com.kh.mt.liveBJ.controller;

import java.io.File;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.common.LoggerInterceptor;
import com.kh.mt.JDBC.model.vo.JDBC;
import com.kh.mt.JDBC.model.vo.JDBCLogoFile;
import com.kh.mt.board.model.vo.Board;
import com.kh.mt.liveBJ.model.service.LiveBJService;
import com.kh.mt.liveBJ.model.vo.Gudock;
import com.kh.mt.liveBJ.model.vo.LiveBj;
import com.kh.mt.liveBJ.model.vo.Peach;
import com.kh.mt.member.model.vo.BJBlackMember;
import com.kh.mt.member.model.vo.Member;

@Controller
public class LiveBJFrontController {
	protected Log log = LogFactory.getLog(getClass());
	/*protected Log log = LogFactory.getLog(LoggerInterceptor.class);*/
	@Autowired
	LiveBJService ls;
	
	//시청자가 방의 정보 가저오기
	@RequestMapping(value="JDBCInfo.lb")
	public ModelAndView JDBCInfo(HttpServletRequest request, ModelAndView mv,String href3, String mId){
		LiveBj bj = ls.JDBCInfo(href3);
		String bjid = bj.getMid();
		
		ArrayList<String> list = ls.selectFan(bjid);
		
		ArrayList<Member> fanlist = new ArrayList<>();
		for(int i =0; i <list.size();i++){
			Member mem = new Member();
			mem.setmId(list.get(i));
			fanlist.add(mem);
		};;
		mv.setViewName("jsonView");
		mv.addObject("bj", bj);
		mv.addObject("fanlist", fanlist);
		
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		String userId = "gost";
			if(loginUser != null){
     		userId = loginUser.getmId();
     	}
	//A가B에게 접속
		log.debug("[" + userId + "]["+ bj.getMid() +"][접속]");
		return mv;
	}
	//bj가 자기정보방 가저오기
	@RequestMapping(value="JDBCInfo2.lb")
	public ModelAndView JDBCInfo2(ModelAndView mv,String href3, String jCode){
		LiveBj bj1 = new LiveBj();
		bj1.setJcode(jCode);
		bj1.setMid(href3);
		//fan
		ArrayList<String> list = ls.selectFan(href3);
		ArrayList<Member> fanlist = new ArrayList<>();
		for(int i =0; i <list.size();i++){
			Member mem = new Member();
			mem.setmId(list.get(i));
			fanlist.add(mem);
		};
		
		
		LiveBj bj = ls.JDBCInfo2(bj1);
		mv.setViewName("jsonView");
		mv.addObject("bj", bj);
		mv.addObject("fanlist", fanlist);
		
		return mv;
	}
	
	@RequestMapping(value="testLiveBj.lb")
	public String ChangeView(){
		return "LiveBj/LiveBjPage";
	}
	//방송시작버튼누르면 db에 주소값 저장
	@RequestMapping(value="startBrod.lb")
	public String startBrod(String roomid,String mid, String bjJCode){
		ls.startBrod(roomid,mid,bjJCode);

		return "성공";
	}
	
	
	//메인페이지에 모든 방송중인 bj불러오기
	@RequestMapping(value="allBJ.lb")
	public ModelAndView allBJ(ModelAndView mv){
		ArrayList<LiveBj> list = ls.allBJ();
		
		ArrayList<LiveBj> list1 = ls.mainTopBJ();
		mv.addObject("list",list);
		mv.addObject("list1", list1);
		mv.setViewName("main/main");
		
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
		
		// UPLOADFILE insert
		JDBCLogoFile f = new JDBCLogoFile();
		f.setFrom_code("BSTitleImg");
		f.setF_orname(originalFileName);
		f.setF_rename(changedName);
		f.setFilepath(filePath);
		f.setF_mcode(bj.getMid());
		
		String bjJcode = ls.insertBSCotent(bj);
		ls.insertBSTitleImg(f);
		bj.setJcode(bjJcode);
		model.addAttribute("bjJ", bj);
		
		//여기 JCODE 리턴 받아서 페이지로 가져가야 함
		return "LiveBj/LiveBjPage";
	}
	@RequestMapping(value="peach.lb")
	public ModelAndView updatePeach(ModelAndView mv, String userId, int peachNum, String bjId , HttpServletRequest request){
		Peach p = new Peach();
		p.setBjId(bjId);
		p.setPeachNum(peachNum);
		p.setUserId(userId);
		int result = ls.updatePeach(p);
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginUser");
		m.getPeach();
		((Member)session.getAttribute("loginUser")).setPeach(m.getPeach() - peachNum);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="textsingo.lb")
	public ModelAndView insertSingo(ModelAndView mv, String singoja,String singoMem, String singoContent){
		Board b = new Board();
		b.setB_title(singoMem);
		b.setB_type("report");
		b.setBwriter(singoja);
		b.setB_content(singoContent);
		int result = ls.insertSingo(b);
		mv.setViewName("jsonView");
		return mv;
	}
	@RequestMapping(value="bjBlackMember.lb")
	public ModelAndView insertBJBlackMember(ModelAndView mv, String adminbj, String blackMember){
		
		BJBlackMember bm = new BJBlackMember();
		bm.setBjMember(adminbj);
		bm.setBlackMember(blackMember);
		
		ArrayList bmArr = ls.insertBJBlackMember(bm);
		mv.setViewName("jsonView");
		mv.addObject("bmArr", bmArr);
		return mv;
	}
	
	//구독 있으면 삭제 없으면 삽입
	@RequestMapping(value="gudockins.lb")
	public ModelAndView insertGudock(ModelAndView mv, String BJ_mCode, String reder_mCode){
		
		Gudock gd = new Gudock();
		
		gd.setBJ_mCode(BJ_mCode);
		gd.setReder_mCode(reder_mCode);
		
		int result = ls.insertGudock(gd);
		
		mv.setViewName("jsonView");
		return mv;
	}
	@RequestMapping(value="insertViewers.lb")
	public ModelAndView insertGudock(ModelAndView mv, int viewers, String bjId9){
        		
		LiveBj bj = new LiveBj();
		bj.setMid(bjId9);
		bj.setV_viewers(viewers);
		int reViewers = ls.updateViewer(bj);
		mv.addObject("reViewers", reViewers);
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="bangjong.lb")
	public ModelAndView bangjong(ModelAndView mv, String bjid,String maxViewer){
		LiveBj bj = new LiveBj();
		bj.setMid(bjid);
		bj.setV_viewers(Integer.parseInt(maxViewer));
		int result = ls.bangjong(bj);
		mv.setViewName("jsonView");
		return mv;
	}
	@RequestMapping(value="scroll.lb")
	public ModelAndView scroll(ModelAndView mv,int num){
		int minus = num * 8;
		int count = (num+1) * 8;
		int result = count - minus;
		ArrayList<LiveBj> list = new ArrayList<>();
		ArrayList<LiveBj> list1 = ls.scroll();
		for(int i = result;i < list1.size();i++){
			LiveBj bj = list1.get(i);
			list.add(bj); 
		}
		mv.addObject("list", list);
		mv.setViewName("jsonView");
		return mv;
	}
}
