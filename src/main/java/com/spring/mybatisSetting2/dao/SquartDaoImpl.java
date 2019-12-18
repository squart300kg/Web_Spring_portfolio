package com.spring.mybatisSetting2.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.mybatisSetting2.dto.SquartDto;

@Repository
public class SquartDaoImpl implements SquartDao {
	
	@Autowired
	private SqlSession session;
	
	private static String namespace = "squart";
	
	//ȸ������ DB�� ���
	@Override
	public void insert(SquartDto squartDto) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".insert", squartDto);
	}
	
	//���̵� �ߺ��˻�
	@Override
	public SquartDto idDuplicateCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("idDuplicateCheck(SquartDaoImpl) 입성");
		return session.selectOne(namespace + ".idCheck", id);
	}
	
	//�̸��� �ߺ��˻�
	@Override
	public SquartDto emailCheck(String email) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("emailCheck(SquartServiceImpl) 이메일 중복검사 시행");
		return session.selectOne(namespace + ".emailCheck", email);
	}
	
	//�ش� email�� ���� Ű ������Ʈ
	@Override
	public void createAuthKey(String Email, String authKey) throws Exception {
		// TODO Auto-generated method stub
		SquartDto dto = new SquartDto();
		dto.setAuthKey(authKey);
		dto.setEmail(Email);
		session.update(namespace + ".createAuthkey",dto);
	}

	//ȸ���� �̸����� �����ϸ� ����Į���� 1�� �ٲ㼭 ���̵� Ȱ��ȭ��Ų��.
	@Override
	public void updateAuth(String id) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".updateAuth", id);
	}
	
	//���̵� Ű������ �ϳ��� ȸ����Ű���� �����´�
	@Override
	public SquartDto getOneUser(String id) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".getOneUser",id);
	}

	@Override
	public void searchPassword(SquartDto squartDto) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".searchPassword",squartDto);
	}

	@Override
	public void updateUserInfo(SquartDto squartDto) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace + ".updateUserInfo",squartDto);
	}

	

	
	
	

}
