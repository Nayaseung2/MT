package com.kh.mt.admin.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Revenue {
	private String mId;
	private String mName;
	private String peach_code;
	private String p_date;
	
	public Revenue() {
		super();
	}
	
	public Revenue(String mId, String mName, String peach_code, String p_date) {
		super();
		this.mId = mId;
		this.mName = mName;
		this.peach_code = peach_code;
		this.p_date = p_date;
	}
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public String getPeach_code() {
		return peach_code;
	}
	public void setPeach_code(String peach_code) {
		this.peach_code = peach_code;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}

	@Override
	public String toString() {
		return "Revenue [mId=" + mId + ", mName=" + mName + ", peach_code=" + peach_code + ", p_date=" + p_date + "]";
	}
	

		
	
}
