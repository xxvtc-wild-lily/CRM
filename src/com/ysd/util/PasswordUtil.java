package com.ysd.util;

import java.security.MessageDigest;
import java.util.Random;

import org.apache.commons.codec.binary.Hex;

public class PasswordUtil {
	/**
	 * 生成随机的盐（指纹码）
	 * @return
	 */
	public static String randomFingerprintNumber() {
		Random r = new Random();
 		String randomVal = "";
 		for(int i = 0; i < 16; i++) {
	 	    String charOrNum = r.nextInt(2) % 2 == 0 ? "char" : "num";
	 	    //输出字母还是数字
	 	    if( "char".equalsIgnoreCase(charOrNum) ) {
		 	    //输出是大写字母还是小写字母
		 	    int temp = r.nextInt(2) % 2 == 0 ? 65 : 97;
		 	    randomVal += (char)(r.nextInt(26) + temp);
	 	    } else if( "num".equalsIgnoreCase(charOrNum) ) {
	 	    	randomVal += String.valueOf(r.nextInt(10));
	 	    }
 		}
		return randomVal;
	}
	/**
	 * 生成含有随机盐的密码
	 */
	public static String generate(String password,String randomVal) {
 		String salt = randomVal.toString();
 		password = md5Hex(password + salt);
 		char[] cs = new char[48];
 		for (int i = 0; i < 48; i += 3) {
 			cs[i] = password.charAt(i / 3 * 2);
 			char c = salt.charAt(i / 3);
 			cs[i + 1] = c;
 			cs[i + 2] = password.charAt(i / 3 * 2 + 1);
 		}
		return new String(cs);
	}
 
	/**
	 * 校验密码是否正确
	 */
	public static boolean verify(String password, String md5) {
 		char[] cs1 = new char[32];
		char[] cs2 = new char[16];
		for (int i = 0; i < 48; i += 3) {
			cs1[i / 3 * 2] = md5.charAt(i);
			cs1[i / 3 * 2 + 1] = md5.charAt(i + 2);
			cs2[i / 3] = md5.charAt(i + 1);
		}
		String salt = new String(cs2);
		return md5Hex(password + salt).equals(new String(cs1));
	}
 
	/**
	 * 获取十六进制字符串形式的MD5摘要
	 */
	public static String md5Hex(String src) {
		try {
			MessageDigest md5 = MessageDigest.getInstance("MD5");
			byte[] bs = md5.digest(src.getBytes());
			return new String(new Hex().encode(bs));
		} catch (Exception e) {
			return null;
		}
	}

}
