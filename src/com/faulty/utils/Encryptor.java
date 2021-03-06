package com.faulty.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encryptor {
	public static String Encrypt(String toEncrypt)
	{
		
		MessageDigest md = null;
		
		try {
			md = MessageDigest.getInstance("SHA-256");
		} catch (NoSuchAlgorithmException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        md.update(toEncrypt.getBytes());
 
        byte byteData[] = md.digest();
        
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
         sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
        
        return sb.toString();
	}
}