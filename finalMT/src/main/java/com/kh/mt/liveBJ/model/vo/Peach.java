package com.kh.mt.liveBJ.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Peach {
	private int peachNum;
	private String userId;
	private String bjId;
	
	public Peach(){
		
	}
	
	public Peach(int peachNum, String userId, String bjId) {
		super();
		this.peachNum = peachNum;
		this.userId = userId;
		this.bjId = bjId;
	}

	public int getPeachNum() {
		return peachNum;
	}

	public void setPeachNum(int peachNum) {
		this.peachNum = peachNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getBjId() {
		return bjId;
	}

	public void setBjId(String bjId) {
		this.bjId = bjId;
	}
	
	
}
