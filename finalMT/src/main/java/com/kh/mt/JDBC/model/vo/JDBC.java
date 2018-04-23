package com.kh.mt.JDBC.model.vo;

import org.springframework.stereotype.Component;

@Component
public class JDBC implements java.io.Serializable{
	private String mid;
	private String jdbc_name;
	private String jdbc_introduce;
	private String jdbc_interest;
	private String guest_book;
	private int visitor;
	
	public JDBC(){}

	public JDBC(String mid, String jdbc_name, String jdbc_introduce, String jdbc_interest, String guest_book,
			int visitor) {
		super();
		this.mid = mid;
		this.jdbc_name = jdbc_name;
		this.jdbc_introduce = jdbc_introduce;
		this.jdbc_interest = jdbc_interest;
		this.guest_book = guest_book;
		this.visitor = visitor;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getJdbc_name() {
		return jdbc_name;
	}

	public void setJdbc_name(String jdbc_name) {
		this.jdbc_name = jdbc_name;
	}

	public String getJdbc_introduce() {
		return jdbc_introduce;
	}

	public void setJdbc_introduce(String jdbc_introduce) {
		this.jdbc_introduce = jdbc_introduce;
	}

	public String getJdbc_interest() {
		return jdbc_interest;
	}

	public void setJdbc_interest(String jdbc_interest) {
		this.jdbc_interest = jdbc_interest;
	}

	public String getGuest_book() {
		return guest_book;
	}

	public void setGuest_book(String guest_book) {
		this.guest_book = guest_book;
	}

	public int getVisitor() {
		return visitor;
	}

	public void setVisitor(int visitor) {
		this.visitor = visitor;
	}

	@Override
	public String toString() {
		return "JDBC [mid=" + mid + ", jdbc_name=" + jdbc_name + ", jdbc_introduce=" + jdbc_introduce
				+ ", jdbc_interest=" + jdbc_interest + ", guest_book=" + guest_book + ", visitor=" + visitor + "]";
	}
	
	
}
