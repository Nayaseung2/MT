package com.kh.mt.admin.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Withdrawal {
	private String mId;
	private String mName;
	private int amount;
	private String account;
	private String wdDate;
	private int wdCode;
	
	public Withdrawal() {
		super();
	}

	public Withdrawal(String mId, String mName, int amount, String account, String wd_date, int wdCode) {
		super();
		this.mId = mId; 
		this.mName = mName;
		this.amount = amount;
		this.account = account;
		this.wdDate = wd_date;
		this.wdCode = wdCode;
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

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getWdDate() {
		return wdDate;
	}

	public void setWdDate(String wdDate) {
		this.wdDate = wdDate;
	}
	
	public int getWdCode(){
		return wdCode;
	}
	
	public void setWdCode(int wdCode){
		this.wdCode = wdCode;
	}


	@Override
	public String toString() {
		return "Withdrawal [mId=" + mId + ", mName=" + mName + ", amount=" + amount + ", account=" + account + ", wdDate="
				+ wdDate + ", wdCode=" + wdCode +"]";
	}
	
	
	
	
}
