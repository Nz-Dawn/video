package com.zd.video.po.sys;

import com.zd.video.common.BasePo;

/**
 * 日志信息
 * 
 * @author Maochao-zhu
 * 
 */
public class Log extends BasePo {
	private Integer id;
	private String uname;
	private String tname;
	private String content;
	private String addTime;
	private long addTimeSecond;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAddTime() {
		return addTime;
	}
	public void setAddTime(String addTime) {
		this.addTime = addTime;
	}
	public long getAddTimeSecond() {
		return addTimeSecond;
	}
	public void setAddTimeSecond(long addTimeSecond) {
		this.addTimeSecond = addTimeSecond;
	}

}
