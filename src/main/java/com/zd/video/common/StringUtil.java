package com.zd.video.common;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 字符串操作类
 * @author Maochao-zhu
 *
 */
public class StringUtil {
	/**
	 * 判断是否为空 
	 * @param str
	 * @return  true 空、 false 不为空
	 */
	public static boolean isBlank(String str){
		if(null==str || "".equals(str) || str.length()==0 ||"undefined".equals(str)){
			return true;
		} else{
			return false;
		} 
	}
	
	/**
	 * 判断字符串是不是【几位数的】数字 
	 * @param str
	 * @param nums位数  null表示不判断位数
	 * @return 
	 */
	public static boolean isNumbers(String str, Integer nums){
		Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");  
		if(null==str){
			return false;
		} else{
			if(null==nums)
			{
		        return pattern.matcher(str).matches();
			}
			else if(str.length()==nums)
			{
				return pattern.matcher(str).matches();
			}
			else
			{
				return false;
			}
				
		} 
	}
	
	/**
	 * 判断是否为空 
	 * @param str
	 * @return  true 不为空、 false 为空
	 */
	public static boolean isNotBlank(String str){
		if(null!=str && !"".equals(str) && str.length()>0 && !str.equals("null") && !str.equals("NULL") && !str.equals("undefined")){
			return true;
		} else{
			return false;
		} 
	}
	
	
	/**
	 * 去除数字中的小说点变成整数
	 * @param value
	 * @return
	 */
	public static Integer removePointsToInt(String value){
		if(isBlank(value)){
			return 0;
		}
		Integer valueInt = 0;
		if(value.contains(".")){ 
			value = value.substring(0, value.indexOf("."));
			valueInt = Integer.valueOf(value);
		}else{
			valueInt = Integer.valueOf(value);
		}
		return  valueInt;
	}
	
	public static String changeStringFeed(String source,int length)
	{
		StringBuffer sb = new StringBuffer();
		for(int i=0;i<source.length();i+=length)
		{
			if((i+length)<source.length())
			{
				sb.append(source.substring(i, i+length)+"\n");
			}else
			{
				sb.append(source.substring(i, source.length()));
			}
		}
		return sb.toString();
		
	}
	
	public static String addStringFont(String source,int font)
	{
		StringBuffer sb = new StringBuffer();
		sb.append("<font size="+font+">");
		sb.append(source);
		sb.append("</font>");
		return sb.toString();
		
	}
	
	/**
     	* 判断是否含有特殊字符
     *
     * @param str
     * @return true为包含，false为不包含
     */
    public static boolean isSpecialChar(String str) {
        String regEx = "[ _`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]|\n|\r|\t";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(str);
        return m.find();
    }
	
	public static void main(String[] args) {
		String s = "2.490";
		System.out.println(changeStringFeed(s,6));	
	}
	
	//查询一个字符出现的资料
	public static int appearNumber(String srcText, String findText) { 
		int count = 0; 
		Pattern p = Pattern.compile(findText); 
		Matcher m = p.matcher(srcText); 
		while (m.find()) { 
			count++; 
		} 
		return count; 
	} 
}
