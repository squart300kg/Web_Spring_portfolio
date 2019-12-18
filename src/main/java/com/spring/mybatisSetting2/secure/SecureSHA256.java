package com.spring.mybatisSetting2.secure;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

//String값 입력하면 SHA256해쉬값으로 변환하여 반환한다.
public class SecureSHA256 {
	public String encryptionSHA256(String str) throws NoSuchAlgorithmException {
		String sha = "";
		
		MessageDigest sh = MessageDigest.getInstance("SHA-256");
		sh.update(str.getBytes());
		byte byteData[] = sh.digest();
		StringBuffer sb = new StringBuffer();
		for(int i = 0; i < byteData.length; i++) {
			sb.append(Integer.toString((byteData[i]&0xff) + 0x100, 16).substring(1));
		}
		sha = sb.toString();
		
		return sha;
	}
	
	
}
