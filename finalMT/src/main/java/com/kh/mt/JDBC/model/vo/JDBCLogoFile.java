package com.kh.mt.JDBC.model.vo;

import org.springframework.stereotype.Component;

@Component
public class JDBCLogoFile implements java.io.Serializable{
	private String file_code;
	private String from_code;
	private String f_orname;
	private String f_rename;
	private String filepath;
	private String f_mcode;
	private String upload_date;
	
	public JDBCLogoFile(){}

	public JDBCLogoFile(String file_code, String from_code, String f_orname, String f_rename, String filepath,
			String f_mcode, String upload_date, String mid) {
		super();
		this.file_code = file_code;
		this.from_code = from_code;
		this.f_orname = f_orname;
		this.f_rename = f_rename;
		this.filepath = filepath;
		this.f_mcode = f_mcode;
		this.upload_date = upload_date;
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

	@Override
	public String toString() {
		return "JDBCLogoFile [file_code=" + file_code + ", from_code=" + from_code + ", f_orname=" + f_orname
				+ ", f_rename=" + f_rename + ", filepath=" + filepath + ", f_mcode=" + f_mcode + ", upload_date="
				+ upload_date + "]";
	}

	
	
}
