package com.spring.workout.dto;

public class AdminLoginDto {
	private String aid;
	private String apw;
	
	
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getApw() {
		return apw;
	}
	public void setApw(String apw) {
		this.apw = apw;
	}
	@Override
	public String toString() {
		return "AdminLoginDto [aid=" + aid + ", apw=" + apw + "]";
	}
	
	
	
}
