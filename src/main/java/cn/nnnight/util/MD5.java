package cn.nnnight.util;

import java.security.MessageDigest;

/**
 * 閲囩敤MD5鍔犲瘑瑙ｅ瘑
 * 
 */
public class MD5 {

	/***
	 * MD5鍔犵爜 鐢熸垚32浣峬d5鐮�
	 */
	public static String string2MD5(String inStr) {
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
			return "";
		}
		char[] charArray = inStr.toCharArray();
		byte[] byteArray = new byte[charArray.length];

		for (int i = 0; i < charArray.length; i++) {
			byteArray[i] = (byte) charArray[i];
		}

		byte[] md5Bytes = md5.digest(byteArray);

		StringBuffer hexValue = new StringBuffer();

		for (byte md5Byte : md5Bytes) {
			int val = (md5Byte) & 0xff;
			if (val < 16) {
				hexValue.append("0");
			}
			hexValue.append(Integer.toHexString(val));
		}

		return hexValue.toString();
	}

	// 娴嬭瘯涓诲嚱鏁�
	public static void main(String args[]) {
		String s = new String("123123" + "{02e68335-b9d1-440b-987c-f309b91b19ca}");
		System.out.println("鍘熷锛�" + s);
		System.out.println("MD5鍚庯細" + string2MD5(s));
		System.out.println("981d6ef0f68fe65644dca54388fd60c3");
	}
}
