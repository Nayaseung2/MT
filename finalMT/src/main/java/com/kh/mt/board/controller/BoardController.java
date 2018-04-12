package com.kh.mt.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.mt.board.model.service.BoardService;
import com.kh.mt.board.model.vo.Board;
import com.kh.mt.board.model.vo.BoardFile;

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
		return "JDBC/myBroadcastStation";
	}
}
