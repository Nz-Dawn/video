package com.zd.video.common;

/**
 *  基本类型设置
 */
public class WebResponseCode {
	  public static final int  SUCCESS = 0;//成功  -> 使用2019-04-16
	  public static final int  FAIL = -1;//失败 -> 使用2019-04-16
	  
	  public static final int  APPSUCCESS = 1;//成功  -> 使用2019-04-16
	  public static final int  APPFAIL = 0;//失败 -> 使用2019-04-16
	  
      public static final int  ERROR = 1002;
      
      public static final String EXECUTIONERROR="000000"; 
      public static final String EXECUTIONERRORMESSAGE="程序异常";
      
      public static final String DATABASEEXECUTIONERROR="000001"; 
      public static final String DATABASEEXECUTIONERRORMESSAGE="数据库链接失败";
      
}
