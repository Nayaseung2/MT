package com.kh.mt.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@RequestMapping(value="showLoginPage.me")
	public String showLoginPage() {
		
		return "member/Login";
	}

	@RequestMapping(value="showJoinPage1.me")
	public String showJoinPage1() {
		
		return "member/Join1";
	}
	@RequestMapping(value="showJoinPage2.me")
	public String showJoinPage2() {
		
		return "member/Join2";
	}
}
