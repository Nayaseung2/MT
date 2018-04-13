package com.kh.mt.board.model.vo;

import org.springframework.stereotype.Component;
  
@Component
public class Board implements java.io.Serializable{
	private String b_code;
	private String v_code;
	private String b_type;
	private String b_title;
	private String b_content;
	private String bwriter;
	private String b_create_date;
	private String b_update_date;
	private int b_count;
	private String b_status;
	
	public Board(){}

	public Board(String b_code, String v_code, String b_type, String b_title, String b_content, String bwriter,
			String b_create_date, String b_update_date, int b_count, String b_status) {
		super();
		this.b_code = b_code;
		this.v_code = v_code;
		this.b_type = b_type;
		this.b_title = b_title;
		this.b_content = b_content;
		this.bwriter = bwriter;
		this.b_create_date = b_create_date;
		this.b_update_date = b_update_date;
		this.b_count = b_count;
		this.b_status = b_status;
	}

	public String getB_code() {
		return b_code;
	}

	public void setB_code(String b_code) {
		this.b_code = b_code;
	}

	public String getV_code() {
		return v_code;
	}

	public void setV_code(String v_code) {
		this.v_code = v_code;
	}

	public String getB_type() {
		return b_type;
	}

	public void setB_type(String b_type) {
		this.b_type = b_type;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getBwriter() {
		return bwriter;
	}

	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
	}

	public String getB_create_date() {
		return b_create_date;
	}

	public void setB_create_date(String b_create_date) {
		this.b_create_date = b_create_date;
	}

	public String getB_update_date() {
		return b_update_date;
	}

	public void setB_update_date(String b_update_date) {
		this.b_update_date = b_update_date;
	}

	public int getB_count() {
		return b_count;
	}

	public void setB_count(int b_count) {
		this.b_count = b_count;
	}

	public String getB_status() {
		return b_status;
	}

	public void setB_status(String b_status) {
		this.b_status = b_status;
	}

	@Override
	public String toString() {
		return "Board [b_code=" + b_code + ", v_code=" + v_code + ", b_type=" + b_type + ", b_title=" + b_title
				+ ", b_content=" + b_content + ", bwriter=" + bwriter + ", b_create_date=" + b_create_date
				+ ", b_update_date=" + b_update_date + ", b_count=" + b_count + ", b_status=" + b_status + "]";
	}
	
}
