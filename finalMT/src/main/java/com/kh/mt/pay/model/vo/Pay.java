package com.kh.mt.pay.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Pay implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	
	private String pay_code;
	private String mcode;
	private int price;
	private int peach_code;
	private Date pay_date;
	private String pay_time;
	
	public Pay() {
		// TODO Auto-generated constructor stub
	}


	public Pay(String pay_code, String mcode, int price, int peach_code, Date pay_date, String pay_time) {
		super();
		this.pay_code = pay_code;
		this.mcode = mcode;
		this.price = price;
		this.peach_code = peach_code;
		this.pay_date = pay_date;
		this.pay_time = pay_time;
	}


	public String getPay_code() {
		return pay_code;
	}


	public void setPay_code(String pay_code) {
		this.pay_code = pay_code;
	}


	public String getMcode() {
		return mcode;
	}


	public void setMcode(String mcode) {
		this.mcode = mcode;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getPeach_code() {
		return peach_code;
	}


	public void setPeach_code(int peach_code) {
		this.peach_code = peach_code;
	}


	public Date getPay_date() {
		return pay_date;
	}


	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}
	

	public String getPay_time() {
		return pay_time;
	}


	public void setPay_time(String pay_time) {
		this.pay_time = pay_time;
	}


	@Override
	public String toString() {
		return "Pay [pay_code=" + pay_code + ", mcode=" + mcode + ", price=" + price + ", peach_code=" + peach_code
				+ ", pay_date=" + pay_date + "]";
	}
	
	
	

}
