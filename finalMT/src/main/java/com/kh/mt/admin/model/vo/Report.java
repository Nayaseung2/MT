package com.kh.mt.admin.model.vo;

import org.springframework.stereotype.Component;

@Component
public class Report {
	private String reporter;
	private String target;
	private String videoYN;
	private String content;
	private int reportSum;
	private String reportDate;
	private String screen;
	private String status;
	
	public Report() {
		super();
	}

	public Report(String reporter, String target, String videoYN, String content, int reportSum, String reportDate, String screen, String status) {
		super();
		this.reporter = reporter;
		this.target = target;
		this.videoYN = videoYN;
		this.content = content;
		this.reportSum = reportSum;
		this.reportDate = reportDate;
		this.screen = screen;
		this.status = status;
	}

	public String getReporter() {
		return reporter;
	}

	public void setReporter(String reporter) {
		this.reporter = reporter;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getVideoYN() {
		return videoYN;
	}

	public void setVideoYN(String videoYN) {
		this.videoYN = videoYN;
	}
	
	public String getContent(){
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public int getReportSum() {
		return reportSum;
	}

	public void setReportSum(int reportSum) {
		this.reportSum = reportSum;
	}

	public String getReportDate() {
		return reportDate;
	}

	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}

	public String getScreen() {
		return screen;
	}

	public void setScreen(String screen) {
		this.screen = screen;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Report [reporter=" + reporter + ", target=" + target + ", videoYN=" + videoYN + ", content=" + content + ", reportSum="
				+ reportSum + ", reportDate=" + reportDate + ", screen=" + screen + "]";
	}
	
	
	
	
}
