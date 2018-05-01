package com.kh.mt.BJPayList.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Black implements Serializable{
	
	private String bj_mcode;
	private String live_mcode;
	private String live_nic;
	private String black_date;
	private String black_status;
	private String black_count;
	
	

	public Black() {
		// TODO Auto-generated constructor stub
	}



	public Black(String bj_mcode, String live_mcode, String live_nic, String black_date, String black_status,
			String black_count) {
		super();
		this.bj_mcode = bj_mcode;
		this.live_mcode = live_mcode;
		this.live_nic = live_nic;
		this.black_date = black_date;
		this.black_status = black_status;
		this.black_count = black_count;
	}



	public String getBj_mcode() {
		return bj_mcode;
	}



	public void setBj_mcode(String bj_mcode) {
		this.bj_mcode = bj_mcode;
	}



	public String getLive_mcode() {
		return live_mcode;
	}



	public void setLive_mcode(String live_mcode) {
		this.live_mcode = live_mcode;
	}



	public String getLive_nic() {
		return live_nic;
	}



	public void setLive_nic(String live_nic) {
		this.live_nic = live_nic;
	}



	public String getBlack_date() {
		return black_date;
	}



	public void setBlack_date(String black_date) {
		this.black_date = black_date;
	}



	public String getBlack_status() {
		return black_status;
	}



	public void setBlack_status(String black_status) {
		this.black_status = black_status;
	}



	public String getBlack_count() {
		return black_count;
	}



	public void setBlack_count(String black_count) {
		this.black_count = black_count;
	}



	@Override
	public String toString() {
		return "Black [bj_mcode=" + bj_mcode + ", live_mcode=" + live_mcode + ", live_nic=" + live_nic + ", black_date="
				+ black_date + ", black_status=" + black_status + ", black_count=" + black_count + "]";
	}



	

}
