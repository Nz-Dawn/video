package com.zd.video.common;


import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.regex.Pattern;

/**
 * 处理数字的Util、计算百分比
 * @author Maochao-zhu
 */
public class NumUtil {
    /**
     * 转换为BigDecimal
     *  
     * @param o
     * @return BigDecimal
     * @author fantasy 
     * @date 2013-8-27
     */
    public static BigDecimal toBig(Object o) {
        if (o == null || o.toString().equals("") || o.toString().equals("NaN")) {
            return new BigDecimal(0);
        }
        return new BigDecimal(o.toString());
    }
    
    /**
     * 计算百分比
     *  
     * @param divisor
     * @param dividend
     * @return String
     * @author fantasy 
     * @date 2013-8-27
     */
    public static String getPercent(Object divisor, Object dividend){
        if(divisor == null || dividend == null){
            return "";
        }
        NumberFormat percent = NumberFormat.getPercentInstance();   
        //建立百分比格式化引用   
        percent.setMaximumFractionDigits(2);
        BigDecimal a = toBig(divisor);
        BigDecimal b = toBig(dividend);
        if(a.equals(toBig(0)) || b.equals(toBig(0)) || a.equals(toBig(0.0)) || b.equals(toBig(0.0))){
       	 return "0.00%";
        }
        BigDecimal c = a.divide(b, 4, BigDecimal.ROUND_DOWN);
        return percent.format(c);
    }
    
    /**
     * 计算比例
     *  
     * @param divisor
     * @param dividend
     * @return String
     * @author fantasy 
     * @date 2013-10-9
     */
    public static String divideNumber(Object divisor, Object dividend){
    	if(divisor == null || dividend == null){
            return "";
        }
    	 BigDecimal a = toBig(divisor);
         BigDecimal b = toBig(dividend);
         if(a.equals(toBig(0)) || b.equals(toBig(0))){
        	 return "0";
         }
         BigDecimal c = a.divide(b, 2, BigDecimal.ROUND_DOWN);
         return c.toString();
    }
    
    /**
     * 去两个数的平均值，四舍五入
     *  
     * @param divisor
     * @param dividend
     * @return int
     * @author fantasy 
     * @date 2013-11-6
     */
    public static int averageNumber(Object divisor, Object dividend){
    	if(divisor == null || dividend == null){
            return 0;
        }
    	BigDecimal a = toBig(divisor);
        BigDecimal b = toBig(dividend);
        if(a.equals(toBig(0)) || b.equals(toBig(0))){
       	 	return 0;
        }
        BigDecimal c = a.divide(b, 0, BigDecimal.ROUND_HALF_UP);
        return c.intValue();
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
}