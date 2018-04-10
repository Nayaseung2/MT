package com.kh.mt.pay.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mt.pay.model.service.PayService;
import com.kh.mt.pay.model.vo.Pay;


@Controller
public class PayController {
	
	@Autowired
	private PayService ps;
	
	public PayController() {
		// TODO Auto-generated constructor stub
	}
	
	//pay 페이지
	@RequestMapping("payform.pay")
	public ModelAndView PayForm(ModelAndView mv){
						
						
		mv.setViewName("pay/payform");
		return mv;
	}
	
	//pay ajax 페이지
	@RequestMapping("paysuccess.pay")
	public ModelAndView PaySuccess(String mcode,String pay_code, int price, String peach_code ,ModelAndView mv){
		Pay p = new Pay();
		p.setPay_code(pay_code);
		p.setMcode(mcode);
		p.setPrice(price);
		p.setPeach_code(peach_code);
		
		ps.insertPayList(p);
		
						
		mv.setViewName("pay/payform");
		return mv;
	}

}