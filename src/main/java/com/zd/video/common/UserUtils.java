package com.zd.video.common;
import com.zd.video.po.sys.User;
import org.apache.shiro.SecurityUtils;

/**
 * 用户相关类
 * @author Maochao-zhu
 *
 */
public class UserUtils {
	/**
	 * 获取当前登录用户信息
	 * web页面获取属性值：
	 * 	例如：登录名称获取   <shiro:principal property="uname"/> 
	 * 		系统配置文件类型   <shiro:principal property="allowFiletype"/>
	 * 	注:uname,allowFiletype 为User中的属性字段
	 * @return
	 */
	public static User getLoginUser(){
		User user  = new User();
		if(null!= SecurityUtils.getSubject()){
			user = (User) SecurityUtils.getSubject().getPrincipal();
		}
		return user;
	}
	
	/**
	 * 获取用户登录名信息
	 * @return
	 */
	public static String getLoginUserName(){
		String username = "";
		User user  = getLoginUser();
		if(null!=user){
			username= user.getUname() +"["+user.getTname()+"]"; 
		}
		return username;
	}
	
}
