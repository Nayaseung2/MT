package com.kh.mt.liveBJ.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.mt.liveBJ.model.service.LiveBJService;

@Controller
public class LiveBJFrontController {

	LiveBJService ls;
	@RequestMapping(value="testLiveBj.lb")
	public String ChangeView(){
		return "LiveBj/LiveBjPage";
	}
	@RequestMapping(value="singo.lb")
	public String Singo(String singoID, String content, String userID){
		ls.singo(singoID, content, userID);
		return "LiveBj/LiveBjPage";
	}
}
