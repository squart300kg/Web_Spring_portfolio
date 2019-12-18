package com.spring.mybatisSetting2.secure;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;

import javax.crypto.Cipher;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.spring.mybatisSetting2.dto.RSA;
 
public class RSAUtil {
    private static final Logger logger = LoggerFactory.getLogger(RSAUtil.class);
 
    private KeyPairGenerator generator;
    private KeyFactory keyFactory;
    private KeyPair keyPair;
    private Cipher cipher;
 
    
    public RSAUtil() {
        try {
            generator = KeyPairGenerator.getInstance("RSA");
            generator.initialize(1024);
            keyFactory = KeyFactory.getInstance("RSA");
            cipher = Cipher.getInstance("RSA");
        } catch (Exception e) {
            logger.warn("RSAUtil 실행 불가.", e);
        }
    }
 
    public RSA createRSA() {
        RSA rsa = null;
        try {
            keyPair = generator.generateKeyPair();
 
            PublicKey publicKey = keyPair.getPublic();
            PrivateKey privateKey = keyPair.getPrivate();
 
            RSAPublicKeySpec publicSpec = keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
            String modulus = publicSpec.getModulus().toString(16);
            String exponent = publicSpec.getPublicExponent().toString(16);
            rsa = new RSA(privateKey, modulus, exponent);
        } catch (Exception e) {
            logger.warn("RSAUtil.createRSA()", e);
        }
        return rsa;
    }
 
    //비밀키를 가지고 복호화 하는 메서드
    public String getDecryptText(PrivateKey privateKey, String encryptedText) throws Exception {
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(hexToByteArray(encryptedText));
        return new String(decryptedBytes, "UTF-8");
    }
    
    //암호화와 복호화를 수행하기 위한 문자 단위인 16진수를 받아 바이트값으로 변환하는 객체
    private byte[] hexToByteArray(String hex) {
        if (hex == null || hex.length() % 2 != 0) {
            return new byte[] {};
        }
 
        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length(); i += 2) {
            byte value = (byte) Integer.parseInt(hex.substring(i, i + 2), 16);
            bytes[(int) Math.floor(i / 2)] = value;
        }
        return bytes;
    }
 
}
