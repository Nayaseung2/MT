package com.kh.mt.BJPayList.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class BJPayList implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String mcode;
	private int wd_code;
	private int price;
	private String wd_date;
	private String status;
	private String success_date;
	private String account;
	
	public BJPayList() {
		// TODO Auto-generated constructor stub
	}

	public BJPayList(String mcode, int wd_code, int price, String wd_date, String status, String success_date,
			String account) {
		super();
		this.mcode = mcode;
		this.wd_code = wd_code;
		this.price = price;
		this.wd_date = wd_date;
		this.status = status;
		this.success_date = success_date;
		this.account = account;
	}

	public String getMcode() {
		return mcode;
	}

	public void setMcode(String mcode) {
		this.mcode = mcode;
	}

	public int getWd_code() {
		return wd_code;
	}

	public void setWd_code(int wd_code) {
		this.wd_code = wd_code;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getWd_date() {
		return wd_date;
	}

	public void setWd_date(String wd_date) {
		this.wd_date = wd_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSuccess_date() {
		return success_date;
	}

	public void setSuccess_date(String success_date) {
		this.success_date = success_date;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	@Override
	public String toString() {
		return "BJPayList [mcode=" + mcode + ", wd_code=" + wd_code + ", price=" + price + ", wd_date=" + wd_date
				+ ", status=" + status + ", success_date=" + success_date + ", account=" + account + "]";
	}
	
	
	
	
}
