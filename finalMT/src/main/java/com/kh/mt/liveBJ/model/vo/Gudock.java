package com.kh.mt.liveBJ.model.vo;

public class Gudock implements java.io.Serializable{
	private String reder_mCode;	//구독자 READER_MCODE
	private String read_date;	//구독날짜 READ_DATE
	private String BJ_mCode;	//구독방송 BJ_MCODE
	public Gudock() {
		super();
	}
	public Gudock(String reder_mCode, String read_date, String bJ_mCode) {
		super();
		this.reder_mCode = reder_mCode;
		this.read_date = read_date;
		BJ_mCode = bJ_mCode;
	}
	public String getReder_mCode() {
		return reder_mCode;
	}
	public void setReder_mCode(String reder_mCode) {
		this.reder_mCode = reder_mCode;
	}
	public String getRead_date() {
		return read_date;
	}
	public void setRead_date(String read_date) {
		this.read_date = read_date;
	}
	public String getBJ_mCode() {
		return BJ_mCode;
	}
	public void setBJ_mCode(String bJ_mCode) {
		BJ_mCode = bJ_mCode;
	}
	@Override
	public String toString() {
		return "Gudock [reder_mCode=" + reder_mCode + ", read_date=" + read_date + ", BJ_mCode=" + BJ_mCode + "]";
	}
	
}
