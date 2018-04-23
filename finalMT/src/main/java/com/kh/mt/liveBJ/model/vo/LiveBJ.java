package com.kh.mt.liveBJ.model.vo;

import org.springframework.stereotype.Component;

@Component
public class LiveBJ {
	private String bjTitle;
	private String fileName;
	private String nickName;
	private String userId;
	private String bjcontent;
	public LiveBJ() {
		super();
	}
	public LiveBJ(String bjTitle, String fileName, String nickName, String userId, String bjcontent) {
		super();
		this.bjTitle = bjTitle;
		this.fileName = fileName;
		this.nickName = nickName;
		this.userId = userId;
		this.bjcontent = bjcontent;
	}
	public String getBjTitle() {
		return bjTitle;
	}
	public void setBjTitle(String bjTitle) {
		this.bjTitle = bjTitle;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBjcontent() {
		return bjcontent;
	}
	public void setBjcontent(String bjcontent) {
		this.bjcontent = bjcontent;
	}
	@Override
	public String toString() {
		return "LiveBJ [bjTitle=" + bjTitle + ", fileName=" + fileName + ", nickName=" + nickName + ", userId=" + userId
				+ ", bjcontent=" + bjcontent + "]";
	}
	
	
}
