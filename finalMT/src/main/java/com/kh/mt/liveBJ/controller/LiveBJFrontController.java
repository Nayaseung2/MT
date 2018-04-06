package com.kh.mt.liveBJ.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LiveBJFrontController {

	@RequestMapping(value="testLiveBj.lb")
	public String ChangeView(){
		return "LiveBj/LiveBjPage";
	}
}
