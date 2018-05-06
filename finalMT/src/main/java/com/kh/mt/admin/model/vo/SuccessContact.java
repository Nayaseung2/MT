package com.kh.mt.admin.model.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class SuccessContact {
	private String b_code;
	private String bwriter;
	private String b_type;
	private String b_title;
	private String b_content;
	private String b_create_date;
	private String content;
	private String create_date;
	
	public SuccessContact() {
		super();
	}
	
	public SuccessContact(String b_code, String bwriter, String b_type, String b_title, String b_content,
			String b_create_date, String content, String create_date) {
		super();
		this.b_code = b_code;
		this.bwriter = bwriter;
		this.b_type = b_type;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_create_date = b_create_date;
		this.content = content;
		this.create_date = create_date;
	}
	
	public String getB_code() {
		return b_code;
	}
	
	public void setB_code(String b_code) {
		this.b_code = b_code;
	}
	
	public String getBwriter() {
		return bwriter;
	}
	
	public void setBwriter(String bwriter) {
		this.bwriter = bwriter;
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
	
	public String getB_create_date() {
		return b_create_date;
	}
	
	public void setB_create_date(String b_create_date) {
		this.b_create_date = b_create_date;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getCreate_date() {
		return create_date;
	}
	
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	
	@Override
	public String toString() {
		return "SuccessContact [b_code=" + b_code + ", bwriter=" + bwriter + ", b_type=" + b_type + ", b_title="
				+ b_title + ", b_content=" + b_content + ", b_create_date=" + b_create_date + ", content=" + content
				+ ", create_date=" + create_date + "]";
	} 
	
	
	
}
