package com.kh.mt.liveBJ.model.vo;

public class Gudock implements java.io.Serializable{
	private String READER_MCODE;	//구독자
	private String READ_DATE;	//구독날짜
	private String BJ_MCODE;	//구독방송
	public Gudock() {
		super();
	}
	public Gudock(String rEADER_MCODE, String rEAD_DATE, String bJ_MCODE) {
		super();
		READER_MCODE = rEADER_MCODE;
		READ_DATE = rEAD_DATE;
		BJ_MCODE = bJ_MCODE;
	}
	public String getREADER_MCODE() {
		return READER_MCODE;
	}
	public void setREADER_MCODE(String rEADER_MCODE) {
		READER_MCODE = rEADER_MCODE;
	}
	public String getREAD_DATE() {
		return READ_DATE;
	}
	public void setREAD_DATE(String rEAD_DATE) {
		READ_DATE = rEAD_DATE;
	}
	public String getBJ_MCODE() {
		return BJ_MCODE;
	}
	public void setBJ_MCODE(String bJ_MCODE) {
		BJ_MCODE = bJ_MCODE;
	}
	@Override
	public String toString() {
		return "Gudock [READER_MCODE=" + READER_MCODE + ", READ_DATE=" + READ_DATE + ", BJ_MCODE=" + BJ_MCODE + "]";
	}
	
}
