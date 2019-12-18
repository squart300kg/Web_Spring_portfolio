package te.pr.domain;

import java.sql.Timestamp;

public class replyVO {
	
	private int rnum;
	private String writer;
	private String content;
	private Timestamp reg_date;
	private int likecount;
	private String ip;
	private int re_step;
	private int re_level;
	//해당 댓글이 어디에 포함되는지 뜻하는 num
	private int num;
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "replyVO [rnum=" + rnum + ", writer=" + writer + ", content=" + content + ", reg_date=" + reg_date
				+ ", likecount=" + likecount + ", ip=" + ip + ", re_step=" + re_step + ", re_level=" + re_level
				+ ", num=" + num + "]";
	}
	
	
	
}
