package com.spring.mybatisSetting2.service;

import java.security.PrivateKey;

import com.spring.mybatisSetting2.dto.SquartDto;

public interface SquartService {
	
	public void insert(SquartDto squartDto) throws Exception;
	
	public SquartDto idDuplicateCheck(String id) throws Exception;
	
	public SquartDto emailCheck(String email) throws Exception;

	public void create(SquartDto squartDto) throws Exception;
	
	public void updateAuth(String id)throws Exception;
	
	public SquartDto getOneUser(String id) throws Exception;
	
	public void sendToEmailId(SquartDto squartDto) throws Exception;

	public void sendToEmailPassword(SquartDto squartDto) throws Exception;
	
	public void updateUserInfo(SquartDto squartDto) throws Exception;
	
	public SquartDto decryptDto(SquartDto squartDto, PrivateKey key) throws Exception;
}
