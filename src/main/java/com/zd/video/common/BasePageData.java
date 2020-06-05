package com.zd.video.common;

/**
 * 返回JSON数据信息，（对应layui数据接收信息）
 * @author Maochao-zhu
 *
 */
public class BasePageData {
	/**
	 * 返回CODE值信息
	 * 0成功
	 * -1失败
	 */
	private int code;
	/**
	 * 描述信息
	 */
	private String msg;
	
	/**
	 * 数据总条数
	 */
	private int count;
	
	/**
	 * 返回数据信息
	 */
	private Object data;
	
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}

}
