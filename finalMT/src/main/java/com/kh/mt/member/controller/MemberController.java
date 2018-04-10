package com.kh.mt.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@RequestMapping("broadcast.me")
	public ModelAndView viewChange(ModelAndView mv) {
		mv.setViewName("LiveBj/LiveBjPage");
		return mv;
	}

}
