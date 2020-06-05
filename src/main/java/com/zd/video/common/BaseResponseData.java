package com.zd.video.common;
import java.util.Map;
public class BaseResponseData {
	private int code;
	private String message;
	private Map<?, ?> responseData;

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Map<?, ?> getResponseData() {
		return responseData;
	}

	public void setResponseData(Map<?, ?> responseData) {
		this.responseData = responseData;
	}

}
