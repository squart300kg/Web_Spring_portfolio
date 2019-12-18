package com.spring.mybatisSetting2.dao;

import com.spring.mybatisSetting2.dto.SquartDto;

public interface SquartDao {
	
	//DB�� ȸ�������� ���
	public void insert(SquartDto squartDto) throws Exception;
	//���̵� �ߺ��˻�
	public SquartDto idDuplicateCheck(String id) throws Exception;
	//�̸��� �ߺ� �˻�
	public SquartDto emailCheck(String email) throws Exception;
	
	public void createAuthKey(String user_email, String user_authCode) throws Exception;
	
	public void updateAuth(String id) throws Exception;
	
	public SquartDto getOneUser(String id) throws Exception;
	
	public void searchPassword(SquartDto squartDto) throws Exception;
	
	public void updateUserInfo(SquartDto squartDto)throws Exception;
}
