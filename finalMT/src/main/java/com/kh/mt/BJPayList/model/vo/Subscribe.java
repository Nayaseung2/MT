package com.kh.mt.BJPayList.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Subscribe implements Serializable{
	
	
	private String reader_mcode;
	private String read_date;
	private String bj_mcode;
	private String reader_mid;
	private String reader_nic;
	private int reader_num;
	
	public Subscribe() {
		// TODO Auto-generated constructor stub
	}

	public Subscribe(String reader_mcode, String read_date, String bj_mcode, String reader_mid, String reader_nic,
			int reader_num) {
		super();
		this.reader_mcode = reader_mcode;
		this.read_date = read_date;
		this.bj_mcode = bj_mcode;
		this.reader_mid = reader_mid;
		this.reader_nic = reader_nic;
		this.reader_num = reader_num;
	}

	public String getReader_mcode() {
		return reader_mcode;
	}

	public void setReader_mcode(String reader_mcode) {
		this.reader_mcode = reader_mcode;
	}

	public String getRead_date() {
		return read_date;
	}

	public void setRead_date(String read_date) {
		this.read_date = read_date;
	}

	public String getBj_mcode() {
		return bj_mcode;
	}

	public void setBj_mcode(String bj_mcode) {
		this.bj_mcode = bj_mcode;
	}

	public String getReader_mid() {
		return reader_mid;
	}

	public void setReader_mid(String reader_mid) {
		this.reader_mid = reader_mid;
	}

	public String getReader_nic() {
		return reader_nic;
	}

	public void setReader_nic(String reader_nic) {
		this.reader_nic = reader_nic;
	}

	public int getReader_num() {
		return reader_num;
	}

	public void setReader_num(int reader_num) {
		this.reader_num = reader_num;
	}

	@Override
	public String toString() {
		return "Subscribe [reader_mcode=" + reader_mcode + ", read_date=" + read_date + ", bj_mcode=" + bj_mcode
				+ ", reader_mid=" + reader_mid + ", reader_nic=" + reader_nic + ", reader_num=" + reader_num + "]";
	}
	
	
	

}
