package com.kesiyas.spring.AsRentCar.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptUtils {

	public static String sha(String message) {
		String resultData = "";
		
		try {
			MessageDigest sha = MessageDigest.getInstance("SHA-256");
			
			byte[] bytes = message.getBytes();
			sha.update(bytes);
			
			byte[] digest = sha.digest();
			
			for(int i = 0; i < digest.length; i++) {
				resultData += Integer.toHexString(digest[i] & 0xff);
			}
			
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return resultData;
	}
}
