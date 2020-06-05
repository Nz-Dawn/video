package com.zd.video.common;

import java.math.BigDecimal;
import java.util.regex.Pattern;

/**
 * 自定义标签类
 * 
 * @author Maochao-zhu
 * 
 */
public class Mction  {

	/**
	 * 判断两个字符串是否相等
	 * 
	 * @param input
	 * @param substring
	 * @return 相等返回true/不相等返回false
	 */
	public static boolean equals(String input, String substring) {
		if (input.equals(substring)) {
			return true;
		}
		return false;
	}

	/**
	 * 判断字符是否属于该字符串数组、字符串截取字段 split exp: arrayone('1','1,23,4',',') 数组是否包含字符串
	 * 
	 * @param input
	 * @param arrayString
	 * @return
	 */
	public static boolean arrayone(String input, String arrayString,
			String split) {
		if (null == input || null == arrayString || null == split)
			return false;
		String[] array = arrayString.split(split);
		if (null == array)
			return false;
		for (int i = 0; i < array.length; i++) {
			if (input.equals(array[i])) {
				return true;
			}
		}
		return false;
	}

	/**
	 * Double类型的数据保留两位小数
	 * 
	 * @param value
	 * @return
	 */
	public static Double formatDouble2(Double value) {
		if (null == value) {
			value = 0d;
		}
		BigDecimal bg = new BigDecimal(value);
		double f1 = bg.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
		return f1;
	}

	/**
	 * 判断字符串是否为数字或小数
	 * @param str
	 * @return
	 */
	public static boolean isNumeric(String str) {
		Pattern pattern = Pattern.compile("[0-9]*");
	    if(str.indexOf(".")>0){//判断是否有小数点
	        if(str.indexOf(".")==str.lastIndexOf(".") && str.split("\\.").length==2){ //判断是否只有一个小数点
	            return pattern.matcher(str.replace(".","")).matches();
	        }else {
	            return false;
	        }
	    }else {
	        return pattern.matcher(str).matches();
	    }
	}
	
	
	/**
	 * 字符串转换为 整数
	 * @param str
	 * @return
	 */
	public static Integer getNumber(String str) {
		if(StringUtil.isBlank(str)){ 
			return 0;
		}
		//判断是否为数字
		if(isNumeric(str)){
			 if(str.indexOf(".")>0){//判断是否有小数点
				return Double.valueOf(str).intValue();
			 }
			return Integer.valueOf(str);
		}else{
			return 0;
		}
	}
	
	
	/**
	 * 转换为Long类型
	 * @param str
	 * @return
	 */
	public static Long getNumberLong(String str) {
		if(StringUtil.isBlank(str)){ 
			return 0l;
		}
		//判断是否为数字
		if(isNumeric(str)){
			if(str.indexOf(".")>0){//判断是否有小数点
				return Double.valueOf(str).longValue();
			}
			return Long.valueOf(str);
		}else{
			return 0l;
		}
	}
	
	/**
	 * 字符串转换为 Float 类型数字
	 * @param str
	 * @return
	 */
	public static Float getNumberFloat(String str) {
		if(StringUtil.isBlank(str)){ 
			return 0f;
		}
		//判断是否为数字
		if(isNumeric(str)){
			return Float.valueOf(str);
		}else{
			return 0f;
		}
	}
	
	/**
	 * 字符串转换为 Float 类型数字
	 * @param str
	 * @return
	 */
	public static Double getNumberDouble(String str) {
		if(StringUtil.isBlank(str)){ 
			return 0d;
		}
		//判断是否为数字
		if(isNumeric(str)){
			return Double.valueOf(str);
		}else{
			return 0d;
		}
	}


	/**
	 * Integer 转化为 Long 类型数据
	 * @param nums
	 * @return
	 */
	public static Long getIntegerToLong(Integer nums) {
		if(null==nums){
			return 0L;
		}
		return Long.valueOf(nums);
	}

	/**
	 * 将 Long 类型转化为 Integer
	 * @param nums
	 * @return
	 */
	public static Integer getLongToInteger(Long nums) {
		if(null==nums){
			return 0;
		}
	 	return nums.intValue();
	}

	public static void main(String[] args) {
//		System.out.println(isNumeric("123你"));
//		System.out.println(getNumber("13.84"));
//		System.out.println(getNumberLong("13.地方84"));

		System.out.println(getIntegerToLong(22));
		System.out.println(getLongToInteger(21L));
	}
}
