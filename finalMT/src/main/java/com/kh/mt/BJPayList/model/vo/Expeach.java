package com.kh.mt.BJPayList.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Expeach implements Serializable{
	private String from_mcode;
	private String to_mcode;
	private int peachcount;
	private String send_date;
	
	public Expeach() {
		// TODO Auto-generated constructor stub
	}

	public Expeach(String from_mcode, String to_mcode, int peachcount, String send_date) {
		super();
		this.from_mcode = from_mcode;
		this.to_mcode = to_mcode;
		this.peachcount = peachcount;
		this.send_date = send_date;
	}

	public String getFrom_mcode() {
		return from_mcode;
	}

	public void setFrom_mcode(String from_mcode) {
		this.from_mcode = from_mcode;
	}

	public String getTo_mcode() {
		return to_mcode;
	}

	public void setTo_mcode(String to_mcode) {
		this.to_mcode = to_mcode;
	}

	public int getPeachcount() {
		return peachcount;
	}

	public void setPeachcount(int peachcount) {
		this.peachcount = peachcount;
	}

	public String getSend_date() {
		return send_date;
	}

	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}

	@Override
	public String toString() {
		return "Expeach [from_mcode=" + from_mcode + ", to_mcode=" + to_mcode + ", peachcount=" + peachcount
				+ ", send_date=" + send_date + "]";
	}
	
	
	
	
}
