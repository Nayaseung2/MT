package com.kh.mt.reply.model.vo;

import java.sql.Date;

public class ReplyVo implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8323948988969823521L;
	
	private String b_code;
	private String r_code;
	private String r_content;
	private String r_writer;
	private Date r_create_date;
	private int r_like;
	
	public ReplyVo() {}

	public ReplyVo(String b_code, String r_code, String r_content, String r_writer, Date r_create_date, int r_like) {
		super();
		this.b_code = b_code;
		this.r_code = r_code;
		this.r_content = r_content;
		this.r_writer = r_writer;
		this.r_create_date = r_create_date;
		this.r_like = r_like;
	}

	public String getB_code() {
		return b_code;
	}

	public String getR_code() {
		return r_code;
	}

	public String getR_content() {
		return r_content;
	}

	public String getR_writer() {
		return r_writer;
	}

	public Date getR_create_date() {
		return r_create_date;
	}

	public int getR_like() {
		return r_like;
	}

	public void setB_code(String b_code) {
		this.b_code = b_code;
	}

	public void setR_code(String r_code) {
		this.r_code = r_code;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}

	public void setR_create_date(Date r_create_date) {
		this.r_create_date = r_create_date;
	}

	public void setR_like(int r_like) {
		this.r_like = r_like;
	}

	@Override
	public String toString() {
		return "ReplyVo [b_code=" + b_code + ", r_code=" + r_code + ", r_content=" + r_content + ", r_writer="
				+ r_writer + ", r_create_date=" + r_create_date + ", r_like=" + r_like + "]";
	}
	

}
