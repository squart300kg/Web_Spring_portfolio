package te.pr.domain;

import java.sql.Timestamp;
public class boardVO {
	private int num;
	private String writer;
	private String subject;
	private String email;
	private String content;
	private Timestamp reg_date;
	private int readcount;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	@Override
	public String toString() {
		return "boardVO [num=" + num + ", writer=" + writer + ", subject=" + subject + ", email=" + email + ", content="
				+ content + ", reg_date=" + reg_date + ", readcount=" + readcount + "]";
	}

	
	
	
}