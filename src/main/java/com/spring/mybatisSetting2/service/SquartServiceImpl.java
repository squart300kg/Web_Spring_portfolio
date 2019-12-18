package com.spring.mybatisSetting2.service;

import java.security.KeyPair;
import java.security.PrivateKey;
import java.security.PublicKey;

import javax.inject.Inject;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.spring.mybatisSetting2.dao.SquartDao;
import com.spring.mybatisSetting2.dto.SquartDto;
import com.spring.mybatisSetting2.handler.MailHandler;
import com.spring.mybatisSetting2.handler.TempKey;
import com.spring.mybatisSetting2.secure.RSAUtil;
import com.spring.mybatisSetting2.secure.SecureSHA256;
@Service
public class SquartServiceImpl implements SquartService {

	@Inject
	private SquartDao dao;
	
	@Inject
	private JavaMailSender mailSender;
	
	//회원정보를 등록한다.
	@Override
	public void insert(SquartDto squartDto) throws Exception {
		// TODO Auto-generated method stub
		//비밀번호를 1.해쉬로 꼬아준다. 2.공개키로 암호화한다.
		SecureSHA256 sha256 = new SecureSHA256();
		squartDto.setPassword(sha256.encryptionSHA256(squartDto.getPassword()));
		
		dao.insert(squartDto);
	}
	
	@Override
	public SquartDto getOneUser(String id) throws Exception {
		
		return dao.getOneUser(id);
	}

	@Override
	public SquartDto idDuplicateCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		return dao.idDuplicateCheck(id);
	}

	@Override
	public SquartDto emailCheck(String email) throws Exception {
		// TODO Auto-generated method stub
		return dao.emailCheck(email);
	}

	@Override
	public void create(SquartDto squartDto) throws Exception {
		//이메일 인증을 위한, GET방식 인증의 헛점을 보안하기 위한 난수 생성
		String authKey = new TempKey().getKey(50, false);
		
		//생성된 난수를 DB에 저장
		dao.createAuthKey(squartDto.getEmail(), authKey);
		
		//이메일 전송을 위한 객체 생성(제목, 내용, 송신자, 수신자)
		MailHandler sendMail = new MailHandler(mailSender);
		//전송할 이메일의 제목
		sendMail.setSubject("[SQUART 서비스 이메일 인증]");
		//이메일의 내용
		sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>")
											.append("<a href='http://localhost:8080/"
													+ "squart/"
													+ "emailConfirm2?authKey=")
											.append(authKey)					  
											.append("&id=")
											.append(squartDto.getId())
											.append("' target='_blank'>이메일 인증 확인</a>")
											.toString());
		//이메일 송신자
		sendMail.setFrom("a01039329810@gmail.com", "스쿼트관리자");
		//이메일 수신자
		sendMail.setTo(squartDto.getEmail());
		//이메일 보내기
		sendMail.send();
	}

	@Override
	public void updateAuth(String id) throws Exception {
		// TODO Auto-generated method stub
		dao.updateAuth(id);
	}

	

	@Override
	public void sendToEmailId(SquartDto squartDto) throws Exception {
		// TODO Auto-generated method stub
		
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[SQUART 아이디 찾기 이메일 발송 서비스]");
		sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>")
											.append("회원님의 아이디는 " + squartDto.getId() + "입니다. 좋은하루 되세요! ^.^*")
											.toString());
		sendMail.setFrom("a01039329810@gmail.com", "스쿼트관리자");
		sendMail.setTo(squartDto.getEmail());
		sendMail.send();
	}

	@Override
	public void sendToEmailPassword(SquartDto squartDto) throws Exception {
		// TODO Auto-generated method stub
		//일단은 비밀번호 '만'전송해준다.
		//추후에 RSA구현해서 바뀌어진 비밀번호를 전송해준다.
		TempKey tempKey = new TempKey();
		String newPassword = tempKey.getKey(5, false);
		SecureSHA256 sha256 = new SecureSHA256();
		String newPwd = sha256.encryptionSHA256(newPassword);
		squartDto.setPassword(newPwd);
		dao.searchPassword(squartDto);
		
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[SQUART 비밀번호 찾기 이메일 발송 서비스]");
		sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>")
											.append("회원님의 비밀번호는 " + newPassword + "입니다. 좋은하루 되세요! ^.^*")
											.toString());
		sendMail.setFrom("a01039329810@gmail.com", "스쿼트관리자");
		sendMail.setTo(squartDto.getEmail());
		sendMail.send();
	}

	@Override
	public void updateUserInfo(SquartDto squartDto) throws Exception {
		// TODO Auto-generated method stub
		
		dao.updateUserInfo(squartDto);
	}

	@Override
	public SquartDto decryptDto(SquartDto squartDto, PrivateKey key) throws Exception {
		// TODO Auto-generated method stub
		RSAUtil rsaUtil = new RSAUtil();
		System.out.println("복호하 되기 전의 ID : " + squartDto.getId());
		squartDto.setId				(rsaUtil.getDecryptText(key, squartDto.getId()));
		squartDto.setPassword		(rsaUtil.getDecryptText(key, squartDto.getPassword()));
		squartDto.setConfirmPassword(rsaUtil.getDecryptText(key, squartDto.getConfirmPassword()));
		squartDto.setEmail			(rsaUtil.getDecryptText(key, squartDto.getEmail()));
		squartDto.setName			(rsaUtil.getDecryptText(key, squartDto.getName()));
		squartDto.setAddress		(rsaUtil.getDecryptText(key, squartDto.getAddress()));
		squartDto.setCaptcha		(rsaUtil.getDecryptText(key, squartDto.getCaptcha()));
		System.out.println("복호하 후의 ID : " + squartDto.getId());
		
		return squartDto;
	}
}
