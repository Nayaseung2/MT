package com.kh.mt.member.model.vo;

import org.springframework.stereotype.Component;

@Component
public class NaverLoginMember implements java.io.Serializable {
	private String id;
	private String email;
	private String ename;
	
	public NaverLoginMember(){}

	public NaverLoginMember(String id, String email, String ename) {
		super();
		this.id = id;
		this.email = email;
		this.ename = ename;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail1(String email) {
		this.email = email;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	@Override
	public String toString() {
		return "NaverLoginMember [id=" + id + ", email=" + email + ", ename=" + ename + "]";
	}
	
}
