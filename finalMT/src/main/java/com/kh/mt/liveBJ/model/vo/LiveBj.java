package com.kh.mt.liveBJ.model.vo;

import org.springframework.stereotype.Component;

@Component
public class LiveBj {
	private String cate;
	private String bsTitle;
	private String bsContent;
	private String mid;
	private String nickname;
	private String f_rename;
	private int like;
	private String starttime;
	private String jcode;
	private String introduce;
	private String v_state;
	private String v_href;
	private int v_viewers;

	public LiveBj() {
		super();
	}
	public LiveBj(String cate, String bsTitle, String bsContent, String mid, String nickname, String f_rename,
			int like, String starttime, String jcode, String introduce, String v_state, String v_href,
			int v_viewers) {
		super();
		this.cate = cate;
		this.bsTitle = bsTitle;
		this.bsContent = bsContent;
		this.mid = mid;
		this.nickname = nickname;
		this.f_rename = f_rename;
		this.like = like;
		this.starttime = starttime;
		this.jcode = jcode;
		this.introduce = introduce;
		this.v_state = v_state;
		this.v_href = v_href;
		this.v_viewers = v_viewers;
	}
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
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getF_rename() {
		return f_rename;
	}
	public void setF_rename(String f_rename) {
		this.f_rename = f_rename;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getJcode() {
		return jcode;
	}
	public void setJcode(String jcode) {
		this.jcode = jcode;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public String getV_state() {
		return v_state;
	}
	public void setV_state(String v_state) {
		this.v_state = v_state;
	}
	public String getV_href() {
		return v_href;
	}
	public void setV_href(String v_href) {
		this.v_href = v_href;
	}
	public int getV_viewers() {
		return v_viewers;
	}
	public void setV_viewers(int v_viewers) {
		this.v_viewers = v_viewers;
	}
	@Override
	public String toString() {
		return "LiveBj [cate=" + cate + ", bsTitle=" + bsTitle + ", bsContent=" + bsContent + ", mid=" + mid
				+ ", nickname=" + nickname + ", f_rename=" + f_rename + ", like=" + like + ", starttime=" + starttime
				+ ", jcode=" + jcode + ", introduce=" + introduce + ", v_state=" + v_state + ", v_href=" + v_href
				+ ", v_viewers=" + v_viewers + "]";
	}

	



}
