package com.kh.mt.member.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component //bean으로 인식
public class Member implements java.io.Serializable{
	private static final long serialVersionUID = 7781937753446844677L;
	
	private String mcode;
	private String mId;
	private String mPwd;
	private String mName;
	private String nickName;
	private String email;
	private String account;
	private String joinDate;
	private String updateDate;
	private String status;
	private String a_status;
	private int peach;
	private String videoYN;
	public Member(){}
	public Member(String mcode, String mId, String mPwd, String mName, String nickName, String email, String account,
			String joinDate, String updateDate, String status, String a_status, int peach, String videoYN) {
		super();
		this.mcode = mcode;
		this.mId = mId;
		this.mPwd = mPwd;
		this.mName = mName;
		this.nickName = nickName;
		this.email = email;
		this.account = account;
		this.joinDate = joinDate;
		this.updateDate = updateDate;
		this.status = status;
		this.a_status = a_status;
		this.peach = peach;
		this.videoYN = videoYN;
	}
	public String getMcode() {
		return mcode;
	}
	public void setMcode(String mcode) {
		this.mcode = mcode;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmPwd() {
		return mPwd;
	}
	public void setmPwd(String mPwd) {
		this.mPwd = mPwd;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getA_status() {
		return a_status;
	}
	public void setA_status(String a_status) {
		this.a_status = a_status;
	}
	public int getPeach() {
		return peach;
	}
	public void setPeach(int peach) {
		this.peach = peach;
	}
	public String getVideoYN() {
		return videoYN;
	}
	public void setVideoYN(String videoYN) {
		this.videoYN = videoYN;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Member [mcode=" + mcode + ", mId=" + mId + ", mPwd=" + mPwd + ", mName=" + mName + ", nickName="
				+ nickName + ", email=" + email + ", account=" + account + ", joinDate=" + joinDate + ", updateDate="
				+ updateDate + ", status=" + status + ", a_status=" + a_status + ", peach=" + peach + ", videoYN="
				+ videoYN + "]";
	}
	
	
}
