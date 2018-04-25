package com.kh.mt.liveBJ.model.vo;

public class LiveBj {
	private String cate;
	private String bsTitle;
	private String bsContent;
	private String mid;

	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public LiveBj() {}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getBsTitle() {
		return bsTitle;
	}
	public void setBsTitle(String bsTitle) {
		this.bsTitle = bsTitle;
	}
	public String getBsContent() {
		return bsContent;
	}
	public void setBsContent(String bsContent) {
		this.bsContent = bsContent;
	}
	
	public LiveBj(String cate, String bsTitle, String bsContent) {
		super();
		this.cate = cate;
		this.bsTitle = bsTitle;
		this.bsContent = bsContent;
	}
	@Override
	public String toString() {
		return "LiveBj [cate=" + cate + ", bsTitle=" + bsTitle + ", bsContent=" + bsContent + ", mid=" + mid + "]";
	}
	
	
	

}
