package com.kh.mt.board.controller;

import java.io.File;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.kh.mt.helpcenter.model.vo.HelpMainVo;
import com.kh.mt.reply.model.vo.ReplyVo;

@Controller
public class BoardController {
	@Autowired
	BoardService bs;

	// 난수만들기
	public static String authNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 8; i++) {
			int num = (int) (Math.random() * 9 + 1);
			buffer.append(num);
		}
		return buffer.toString();
	}

	@RequestMapping(value = "insertBoard.board")
	public String insertBoardfromJDBC(Board b, Model model,
			@RequestParam(name = "Boardfile", required = false) MultipartFile photo, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\BoardFile";
		String originalFileName = photo.getOriginalFilename();
		String ext = originalFileName.substring(originalFileName.lastIndexOf('.'));
		String changedName = authNum() + ext;

		try {
			photo.transferTo(new File(filePath + "\\" + changedName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("b : " + b);

		// Board넣기
		bs.insertBoard(b);

		// 게시판 파일 insert
		BoardFile f = new BoardFile();
		f.setF_orname(originalFileName);
		f.setF_rename(changedName);
		f.setFilepath(filePath);
		f.setF_mcode(b.getBwriter());
		bs.insertBoardFile(f);

		return "JDBC/BSwriteSuccess";
	}

	// 방명록 글쓰러 가기
	@RequestMapping(value = "insertGuestBook1.board")
	public String insertGuestBook1() {

		return "JDBC/BSguestBook";
	}

	// 방명록 insert
	@RequestMapping(value = "insertGuestBook.board")
	public String insertGuestBook(Board b) {

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
	@RequestMapping(value = "BSmyBoard.board")
	public ModelAndView showBSmyBoard(ModelAndView mv, String newCurrentPage, String mId) {

		// System.out.println("controller's mId : " + mId);

		PageInfo pi = addPage(newCurrentPage, mId);

		ArrayList<Board> mbList = bs.mbList(pi, mId);

		HashMap hmap = new HashMap();

		hmap.put("pi", pi);
		hmap.put("mbList", mbList);

		mv.addObject("hmap", hmap);

		if (newCurrentPage == null) {
			mv.setViewName("JDBC/BSmyBoard");
		} else {
			mv.setViewName("jsonView");
		}

		return mv;
	}

	// 페이징 처리 메소드
	public PageInfo addPage(String newCurrentPage, String mId) {

		int currentPage = 1;
		int limit = 0;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		int listCount = 0;

		limit = 10;

		listCount = bs.mbListTotal(mId);

		if (newCurrentPage != null) {
			currentPage = Integer.parseInt(newCurrentPage);
		}

		maxPage = (int) ((double) listCount / limit + 0.9);

		startPage = ((int) ((double) currentPage / limit + 0.9) - 1) * limit + 1;

		endPage = startPage + limit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		return new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
	}

	// 방송국 - 내 게시판 상세보기
	@RequestMapping(value = "BSmyBoardDetail.board")
	public ModelAndView showHelpCenterNoticeDetail(ModelAndView mv, String bwriter, String b_code,
			String newCurrentPage) {

		mv.setViewName("JDBC/BSmyBoardDetail");

		Board b = new Board();
		b.setB_code(b_code);
		b.setBwriter(bwriter);

		Board mbListDetail = bs.mbListDetail(b);

		BoardFile bf = new BoardFile();
		bf.setFrom_code(b_code);

		BoardFile mbListDetailP = bs.mbListDetailP(bf);

		// System.out.println("controller's rename: " +
		// mbListDetailP.getF_rename());

		HashMap hmap = new HashMap();
		hmap.put("mbListDetail", mbListDetail);
		hmap.put("mbListDetailP", mbListDetailP);

		// 댓글페이징
		int count = bs.selectReplyCount(b);
		PageInfo pi = addUserPage(newCurrentPage, count);
		hmap.put("pi", pi);
		ArrayList<ReplyVo> list = bs.selectReplyList(b, pi);
		hmap.put("list", list);

		mv.addObject("hmap", hmap);

		
		return mv;
	}
	
	@RequestMapping("replyPage.board")
	public ModelAndView replyPage(ModelAndView mv, String newCurrentPage, String b_code){
		int count = bs.boardReplyCount(b_code);
		
		PageInfo pi = addUserPage(newCurrentPage, count);
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		Board b = new Board();
		b.setB_code(b_code);
		
		ArrayList<ReplyVo> list = bs.selectReplyList(b, pi);
		
		hmap.put("list", list);
		hmap.put("pi", pi);
		
		mv.addObject("map", hmap);
		
		System.out.println(hmap);
		
		mv.setViewName("jsonView");
		
		return mv;
	}
	

	// 방송국 - 내 게시판 글 수정하러 가기(조회)
	@RequestMapping(value = "BSmodify.board")
	public String BSmodify(Model model, String b_code, String bwriter, HttpServletRequest request,
			@RequestParam(name = "Boardfile", required = false) MultipartFile photo) {

		// System.out.println(b_code + "/" + bwriter);

		Board mbListDetail = null;
		Board b = new Board();
		b.setB_code(b_code);
		b.setBwriter(bwriter);

		mbListDetail = bs.mbListDetail(b);

		// System.out.println("글 : " + mbListDetail);

		model.addAttribute("m", mbListDetail);

		/*
		 * String root =
		 * request.getSession().getServletContext().getRealPath("resources");
		 * String filePath = root + "\\BoardFile"; String
		 * originalFileName=photo.getOriginalFilename(); String ext =
		 * originalFileName.substring(originalFileName.lastIndexOf('.')); String
		 * changedName = authNum() + ext;
		 * 
		 * try { photo.transferTo(new File(filePath + "\\" + changedName)); }
		 * catch (IllegalStateException | IOException e) { e.printStackTrace();
		 * }
		 */
		/*
		 * String bwriter = mbListDetail.getBwriter(); String crDate =
		 * mbListDetail.getB_create_date();
		 * 
		 * BoardFile bf = new BoardFile(); bf.setF_mcode(bwriter);
		 * bf.setUpload_date(crDate);
		 * 
		 * BoardFile mbListDetailP = bs.mbListDetailP(bf);
		 * 
		 * HashMap hmap = new HashMap(); hmap.put("mbListDetail", mbListDetail);
		 * hmap.put("mbListDetailP", mbListDetailP);
		 * 
		 * model.addAttribute(hmap);
		 */

		return "JDBC/BSmodify";
	}

	// 방송국 - 내 게시판 글 수정
	@RequestMapping(value = "BSmyBoardModify.board")
	public String BSmyBoardModify(Model model, Board b, String b_code, String bwriter, HttpServletRequest request,
			@RequestParam(name = "Boardfile", required = false) MultipartFile photo) {

		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\BoardFile";
		String originalFileName = photo.getOriginalFilename();
		String ext = originalFileName.substring(originalFileName.lastIndexOf('.'));
		String changedName = authNum() + ext;

		try {
			photo.transferTo(new File(filePath + "\\" + changedName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		// 글 update
		bs.BSmyBoardModify(b);

		System.out.println(b_code);
		System.out.println(bwriter);

		// update된 글 조회
		Board updateB = new Board();
		updateB.setB_code(b_code);
		updateB.setBwriter(bwriter);

		Board ub = bs.mbListDetail(updateB);

		System.out.println("ub.getW : " + ub.getBwriter());
		System.out.println("ub.getUD : " + ub.getB_update_date());

		// 사진 update
		BoardFile f = new BoardFile();
		f.setFrom_code(b_code);
		f.setF_orname(originalFileName);
		f.setF_rename(changedName);
		f.setFilepath(filePath);
		f.setF_mcode(ub.getBwriter());
		f.setUpload_date(ub.getB_update_date());
		bs.BSmyBoardModifyP(f);

		return "JDBC/BSmyBoardModifySuccess";
	}

	// 방송국 - 내 게시판 글 삭제
	@RequestMapping(value = "BSmyBoardDelete.board")
	public String BSmyBoardDelete(String b_code) {

		bs.BSmyBoardDelete(b_code);

		return "JDBC/BSmyBoardDelete";
	}

	// 방송국 - 방명록 삭제

	@RequestMapping(value="BSguestDelete.board")
	public String BSguestDelete(String b_code) {

		bs.BSguestDelte(b_code);

		return "JDBC/BSmyBoardDelete";
	}

	public PageInfo addUserPage(String newCurrentPage, int count) {

		int currentPage = 1;
		int limit = 0;
		int maxPage = 0;
		int startPage = 0;
		int endPage = 0;
		int listCount = 0;

		limit = 4;

		listCount = count;

		if (newCurrentPage != null) {
			currentPage = Integer.parseInt(newCurrentPage);
		}

		maxPage = (int) ((double) listCount / limit + 0.9);

		startPage = (((int) ((double) currentPage / limit + 0.9 - 1)) * limit) + 1;
		System.out.println("startPage" + startPage);
		endPage = startPage + limit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}
		System.out.println("currentPage" + currentPage);
		System.out.println("listCount" + listCount);
		System.out.println("limit" + limit);
		System.out.println("maxPage" + maxPage);
		System.out.println("startPage" + startPage);
		System.out.println("endPage" + endPage);

		return new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
	}

	@RequestMapping(value = "insertReply.board")
	public ModelAndView BSmyBoardDelete(ModelAndView mv, String replyContent, String writer, String boardno) {

		ReplyVo re = new ReplyVo();
		re.setB_code(boardno);
		re.setR_content(replyContent);
		re.setR_writer(writer);
		System.out.println(boardno);
		System.out.println(replyContent);
		System.out.println(writer);
		System.out.println(re);
		int result = bs.insertReply(re);

		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd kk:mm:ss");
		String sysdate = date.format(new Date());
		mv.addObject("date", sysdate);
		mv.setViewName("jsonView");

		return mv;
	}

}
