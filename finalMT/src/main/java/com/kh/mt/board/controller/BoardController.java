package com.kh.mt.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mt.JDBC.model.vo.JDBC;
import com.kh.mt.board.model.service.BoardService;
import com.kh.mt.board.model.vo.Board;
import com.kh.mt.board.model.vo.BoardFile;
import com.kh.mt.common.PageInfo;

@Controller
public class BoardController {
	@Autowired
	BoardService bs;
	
	//난수만들기
	public static String authNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 8; i++) {
			int num = (int) (Math.random() * 9 + 1);
			buffer.append(num);
		}
		return buffer.toString();
	}
	
	@RequestMapping(value="insertBoard.board")
	public String insertBoardfromJDBC(Board b,Model model,@RequestParam(name="Boardfile",required=false)MultipartFile photo,HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\BoardFile";
		String originalFileName=photo.getOriginalFilename();
		String ext = originalFileName.substring(originalFileName.lastIndexOf('.'));
		String changedName = authNum() + ext;
		
		try {
			photo.transferTo(new File(filePath + "\\" + changedName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//게시판 파일 insert
		BoardFile f = new BoardFile();
		f.setFrom_code("BoardFile");
		f.setF_orname(originalFileName);
		f.setF_rename(changedName);
		f.setFilepath(filePath);
		f.setF_mcode(b.getBwriter());
		bs.insertBoardFile(f);
		
		//Board넣기
		bs.insertBoard(b);
		return "JDBC/BSwriteSuccess";
	}
	

	// 방명록 글쓰러 가기
	@RequestMapping(value="insertGuestBook1.board")
	public String insertGuestBook1(){
		
		return "JDBC/BSguestBook";
	}
	
	//방명록 insert
	@RequestMapping(value="insertGuestBook.board")
	public String insertGuestBook(Board b){
		
		bs.insertGuestBook(b);
		
		return "JDBC/BSwriteSuccess";
	}
	
	// 방명록 목록
	@RequestMapping(value = "guestBookList.board")
	public ModelAndView showGuestBookList(ModelAndView mv, String mId) {
		
		ArrayList<Board> gList = bs.gList(mId);
		
		HashMap hmap = new HashMap();
		
		hmap.put("gList", gList);
		
		mv.addObject("hmap", hmap);
		
		mv.setViewName("JDBC/BSGuestBookList");
		
		return mv;
	}
	
	// 방송국 - 내 게시판 목록
	@RequestMapping(value="BSmyBoard.board")
	public ModelAndView showBSmyBoard(ModelAndView mv, String newCurrentPage,
										String mId) {
		
		//System.out.println("controller's mId : " + mId);
		
		PageInfo pi = addPage(newCurrentPage, mId);
		
		ArrayList<Board> mbList = bs.mbList(pi, mId);
		
		HashMap hmap = new HashMap();
		
		hmap.put("pi", pi);
		hmap.put("mbList", mbList);
		
		mv.addObject("hmap", hmap);
		
		if(newCurrentPage == null) {
			mv.setViewName("JDBC/BSmyBoard");
		}else {
			mv.setViewName("jsonView");
		}

		return mv; 
	}
	
	// 페이징 처리 메소드
	public PageInfo addPage(String newCurrentPage, String mId){
		
		int currentPage = 1;
		int limit = 0;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		int listCount = 0;

		limit = 10;

		listCount = bs.mbListTotal(mId);

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
	

	// 방송국 - 내 게시판 상세보기
	@RequestMapping(value="BSmyBoardDetail.board")
	public ModelAndView showHelpCenterNoticeDetail(ModelAndView mv, String bwriter, String b_code) {

		mv.setViewName("JDBC/BSmyBoardDetail");

		Board b = new Board();
		b.setB_code(b_code);
		b.setBwriter(bwriter);
		
		Board mbListDetail = bs.mbListDetail(b);
		
		String crDate = mbListDetail.getB_create_date();
		
		BoardFile bf = new BoardFile();
		bf.setF_mcode(bwriter);
		bf.setUpload_date(crDate);
		
		BoardFile mbListDetailP = bs.mbListDetailP(bf);
		
		//System.out.println("controller's rename: " + mbListDetailP.getF_rename());

		HashMap hmap = new HashMap();
		hmap.put("mbListDetail", mbListDetail);
		hmap.put("mbListDetailP", mbListDetailP);
		
		mv.addObject("hmap", hmap);
		
		return mv;
	}
		
	// 방송국 - 내 게시판 글 삭제
	@RequestMapping(value="BSmyBoardDelete.board")
	public String BSmyBoardDelete(String b_code){
		
		bs.BSmyBoardDelete(b_code);
		
		return "JDBC/BSmyBoardDelete";
	}
	
	
	
	
	
	
	
}
