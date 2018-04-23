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
	public ModelAndView PayForm(ModelAndView mv, String mcode){
		System.out.println(mcode);			
		int peach = ps.selectPeach(mcode);		
		System.out.println("컨트롤러  peach"+peach);
		mv.addObject("peach", peach);
		mv.setViewName("pay/payform");
		return mv;
	}
	
	//pay ajax 페이지
	@RequestMapping("paysuccess.pay")
	public ModelAndView PaySuccess(String mcode,String pay_code, int price, int peach_code ,ModelAndView mv){
		System.out.println("여기는 오니???"+mcode+" pay_code 직자~!"+pay_code);
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
