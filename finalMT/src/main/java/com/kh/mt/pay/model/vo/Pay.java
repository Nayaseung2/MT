package com.kh.mt.pay.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Pay implements Serializable{
	
	private String pay_code;
	private String mcode;
	private int price;
	private String peach_code;
	private Date pay_date;
	
	
	public Pay() {
		// TODO Auto-generated constructor stub
	}


	public Pay(String pay_code, String mcode, int price, String peach_code, Date pay_date) {
		super();
		this.pay_code = pay_code;
		this.mcode = mcode;
		this.price = price;
		this.peach_code = peach_code;
		this.pay_date = pay_date;
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


	public String getPeach_code() {
		return peach_code;
	}


	public void setPeach_code(String peach_code) {
		this.peach_code = peach_code;
	}


	public Date getPay_date() {
		return pay_date;
	}


	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}


	@Override
	public String toString() {
		return "Pay [pay_code=" + pay_code + ", mcode=" + mcode + ", price=" + price + ", peach_code=" + peach_code
				+ ", pay_date=" + pay_date + "]";
	}
	
	
	

}
