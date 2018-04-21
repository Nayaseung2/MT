package com.kh.mt.admin.model.vo;

public class Contact {
	private String bCode;
	private String vCode;
	private String bType;
	private String bTitle;
	private String bContent;
	private String bWriter;
	private String bCreateDate;
	private String bUpdateDate;
	private int bCount;
	private String bStatus;
	
	public Contact() {
		super();
	}

	public Contact(String bCode, String vCode, String bType, String bTitle, String bContent, String bWriter,
			String bCreateDate, String bUpdateDate, int bCount, String bStatus) {
		super();
		this.bCode = bCode;
		this.vCode = vCode;
		this.bType = bType;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.bCreateDate = bCreateDate;
		this.bUpdateDate = bUpdateDate;
		this.bCount = bCount;
		this.bStatus = bStatus;
	}

	public String getbCode() {
		return bCode;
	}

	public void setbCode(String bCode) {
		this.bCode = bCode;
	}

	public String getvCode() {
		return vCode;
	}

	public void setvCode(String vCode) {
		this.vCode = vCode;
	}

	public String getbType() {
		return bType;
	}

	public void setbType(String bType) {
		this.bType = bType;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getbCreateDate() {
		return bCreateDate;
	}

	public void setbCreateDate(String bCreateDate) {
		this.bCreateDate = bCreateDate;
	}

	public String getbUpdateDate() {
		return bUpdateDate;
	}

	public void setbUpdateDate(String bUpdateDate) {
		this.bUpdateDate = bUpdateDate;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	@Override
	public String toString() {
		return "Contact [bCode=" + bCode + ", vCode=" + vCode + ", bType=" + bType + ", bTitle=" + bTitle
				+ ", bContent=" + bContent + ", bWriter=" + bWriter + ", bCreateDate=" + bCreateDate + ", bUpdateDate="
				+ bUpdateDate + ", bCount=" + bCount + ", bStatus=" + bStatus + "]";
	}
	
	
	
	
	
}
