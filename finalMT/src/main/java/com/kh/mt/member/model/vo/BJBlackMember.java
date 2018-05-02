package com.kh.mt.member.model.vo;

public class BJBlackMember implements java.io.Serializable{
	private String bjMember;
	private String blackMember;
	private String blackMemberNickName;
	private String blackDate;
	private String blackStatus;
	
	public BJBlackMember() {
		super();
	}

	public BJBlackMember(String bjMember, String blackMember, String blackMemberNickName, String blackDate,
			String blackStatus) {
		super();
		this.bjMember = bjMember;
		this.blackMember = blackMember;
		this.blackMemberNickName = blackMemberNickName;
		this.blackDate = blackDate;
		this.blackStatus = blackStatus;
	}

	public String getBjMember() {
		return bjMember;
	}

	public void setBjMember(String bjMember) {
		this.bjMember = bjMember;
	}

	public String getBlackMember() {
		return blackMember;
	}

	public void setBlackMember(String blackMember) {
		this.blackMember = blackMember;
	}

	public String getBlackMemberNickName() {
		return blackMemberNickName;
	}

	public void setBlackMemberNickName(String blackMemberNickName) {
		this.blackMemberNickName = blackMemberNickName;
	}

	public String getBlackDate() {
		return blackDate;
	}

	public void setBlackDate(String blackDate) {
		this.blackDate = blackDate;
	}

	public String getBlackStatus() {
		return blackStatus;
	}

	public void setBlackStatus(String blackStatus) {
		this.blackStatus = blackStatus;
	}

	@Override
	public String toString() {
		return "BJBlackMember [bjMember=" + bjMember + ", blackMember=" + blackMember + ", blackMemberNickName="
				+ blackMemberNickName + ", blackDate=" + blackDate + ", blackStatus=" + blackStatus + "]";
	}
	
	
}
