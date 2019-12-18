package com.spring.mybatisSetting2.dao;

import com.spring.mybatisSetting2.dto.SquartDto;

public interface SquartDao {
	
	//DB에 회원정보를 등록
	public void insert(SquartDto squartDto) throws Exception;
	//아이디 중복검사
	public SquartDto idDuplicateCheck(String id) throws Exception;
	//이메일 중복 검사
	public SquartDto emailCheck(String email) throws Exception;
	
	public void createAuthKey(String user_email, String user_authCode) throws Exception;
	
	public void updateAuth(String id) throws Exception;
	
	public SquartDto getOneUser(String id) throws Exception;
	
	public void searchPassword(SquartDto squartDto) throws Exception;
	
	public void updateUserInfo(SquartDto squartDto)throws Exception;
}
