package te.pr.domain;

import java.sql.Timestamp;
public class likeHistoryVO {
	private int Lnum;
	private String lid;
	private int rnum;

	
	
	
	public int getLnum() {
		return Lnum;
	}




	public void setLnum(int lnum) {
		Lnum = lnum;
	}




	public String getLid() {
		return lid;
	}




	public void setLid(String lid) {
		this.lid = lid;
	}




	public int getRnum() {
		return rnum;
	}




	public void setRnum(int rnum) {
		this.rnum = rnum;
	}




	@Override
	public String toString() {
		return "likeHistoryVO [Lnum=" + Lnum + ", lid=" + lid + ", rnum=" + rnum + "]";
	}





	
	
	
}