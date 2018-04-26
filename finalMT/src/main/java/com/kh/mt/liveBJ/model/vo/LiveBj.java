package com.kh.mt.liveBJ.model.vo;

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
		
		
		
	
	

	public String getNickname() {
			return nickname;
		}
		public void setNickname(String nickname) {
			this.nickname = nickname;
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
	public String getF_rename() {
		return f_rename;
	}
	public void setF_rename(String f_rename) {
		this.f_rename = f_rename;
	}
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
