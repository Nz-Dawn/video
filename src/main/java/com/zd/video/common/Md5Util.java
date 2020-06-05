package com.zd.video.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.springframework.util.StringUtils;

/**
 * MD5加密
 */
public class Md5Util {
    private final static String[] strDigits = { "0", "1", "2", "3", "4", "5",
            "6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };

    public Md5Util() {
    }

    private static String byteToArrayString(byte bByte) {
        int iRet = bByte;
        if (iRet < 0) {
            iRet += 256;
        }
        int iD1 = iRet / 16;
        int iD2 = iRet % 16;
        return strDigits[iD1] + strDigits[iD2];
    }

    private static String byteToString(byte[] bByte) {
        StringBuffer sBuffer = new StringBuffer();
        for (int i = 0; i < bByte.length; i++) {
            sBuffer.append(byteToArrayString(bByte[i]));
        }
        return sBuffer.toString();
    }

    public static String GetMD5Code(String strObj) {
        String resultString = null;
        try {
            resultString = new String(strObj);
            MessageDigest md = MessageDigest.getInstance("MD5");
            resultString = byteToString(md.digest(strObj.getBytes()));
        } catch (NoSuchAlgorithmException ex) {
        }
        return resultString;
    }
    
    /**
     * 获取用户加密密码
     * @param pwd
     * @return
     */
    public static String getUserPassWord(String pwd){
    	String password = "";
    	//用户默认密码
    	if(null==pwd || "".equals(pwd)){ 
    		pwd="123456";
    	}
        password= GetMD5Code(pwd);
    	return password;
    }
    
    /**
     * 判断密码是否相等
     * @param pwd1 加密前密码
     * @param pwd2 加密后密码
     * @return
     */
    public static Boolean isEqualPassWord(String pwd1,String pwd2){
    	boolean falg = false;
    	if(pwd2.equals(getUserPassWord(pwd1))){
    		falg =true;
    	}
    	return falg;
    }
    
    
    public static void main(String[] args) {
		System.out.println(getUserPassWord("123123"));
	}
}
