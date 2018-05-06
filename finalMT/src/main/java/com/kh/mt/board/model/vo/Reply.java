package com.kh.mt.board.model.vo;

public class Reply implements java.io.Serializable{

	private String replyContent;
	private String writer;
	private String Boardno;
	public Reply() {
		super();
	}
	public Reply(String replyContent, String writer, String boardno) {
		super();
		this.replyContent = replyContent;
		this.writer = writer;
		Boardno = boardno;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getBoardno() {
		return Boardno;
	}
	public void setBoardno(String boardno) {
		Boardno = boardno;
	}
	@Override
	public String toString() {
		return "Reply [replyContent=" + replyContent + ", writer=" + writer + ", Boardno=" + Boardno + "]";
	}
	
	
}
