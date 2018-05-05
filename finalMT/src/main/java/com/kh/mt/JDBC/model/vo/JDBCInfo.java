package com.kh.mt.JDBC.model.vo;

public class JDBCInfo  implements java.io.Serializable{
	private String file_code;
	private String from_code;
	private String f_orname;
	private String f_rename;
	private String filepath;
	private String f_mcode;
	private String upload_date;
	private String jdbc_nickName;
	private String jdbc_name;
	private String jdbc_introduce;
	private String jdbc_interest;
	private String guest_book;
	private int visitor;
	public JDBCInfo() {
		super();
	}
	public JDBCInfo(String file_code, String from_code, String f_orname, String f_rename, String filepath,
			String f_mcode, String upload_date, String jdbc_nickName, String jdbc_name, String jdbc_introduce,
			String jdbc_interest, String guest_book, int visitor) {
		super();
		this.file_code = file_code;
		this.from_code = from_code;
		this.f_orname = f_orname;
		this.f_rename = f_rename;
		this.filepath = filepath;
		this.f_mcode = f_mcode;
		this.upload_date = upload_date;
		this.jdbc_nickName = jdbc_nickName;
		this.jdbc_name = jdbc_name;
		this.jdbc_introduce = jdbc_introduce;
		this.jdbc_interest = jdbc_interest;
		this.guest_book = guest_book;
		this.visitor = visitor;
	}
	
	public String getFile_code() {
		return file_code;
	}
	public void setFile_code(String file_code) {
		this.file_code = file_code;
	}
	public String getFrom_code() {
		return from_code;
	}
	public void setFrom_code(String from_code) {
		this.from_code = from_code;
	}
	public String getF_orname() {
		return f_orname;
	}
	public void setF_orname(String f_orname) {
		this.f_orname = f_orname;
	}
	public String getF_rename() {
		return f_rename;
	}
	public void setF_rename(String f_rename) {
		this.f_rename = f_rename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getF_mcode() {
		return f_mcode;
	}
	public void setF_mcode(String f_mcode) {
		this.f_mcode = f_mcode;
	}
	public String getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}
	public String getJdbc_nickName() {
		return jdbc_nickName;
	}
	public void setJdbc_nickName(String jdbc_nickName) {
		this.jdbc_nickName = jdbc_nickName;
	}
	public String getJdbc_name() {
		return jdbc_name;
	}
	public void setJdbc_name(String jdbc_name) {
		this.jdbc_name = jdbc_name;
	}
	public String getJdbc_introduce() {
		return jdbc_introduce;
	}
	public void setJdbc_introduce(String jdbc_introduce) {
		this.jdbc_introduce = jdbc_introduce;
	}
	public String getJdbc_interest() {
		return jdbc_interest;
	}
	public void setJdbc_interest(String jdbc_interest) {
		this.jdbc_interest = jdbc_interest;
	}
	public String getGuest_book() {
		return guest_book;
	}
	public void setGuest_book(String guest_book) {
		this.guest_book = guest_book;
	}
	public int getVisitor() {
		return visitor;
	}
	public void setVisitor(int visitor) {
		this.visitor = visitor;
	}
	@Override
	public String toString() {
		return "JDBCInfo [file_code=" + file_code + ", from_code=" + from_code + ", f_orname=" + f_orname
				+ ", f_rename=" + f_rename + ", filepath=" + filepath + ", f_mcode=" + f_mcode + ", upload_date="
				+ upload_date + ", jdbc_nickName=" + jdbc_nickName + ", jdbc_name=" + jdbc_name + ", jdbc_introduce="
				+ jdbc_introduce + ", jdbc_interest=" + jdbc_interest + ", guest_book=" + guest_book + ", visitor="
				+ visitor + "]";
	}
	
	
}
