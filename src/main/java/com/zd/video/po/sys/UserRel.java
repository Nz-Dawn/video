package com.zd.video.po.sys;

public class UserRel {
	private Integer uId;
	private Integer tId;
	public Integer getuId() {
		return uId;
	}
	public void setuId(Integer uId) {
		this.uId = uId;
	}
	public Integer gettId() {
		return tId;
	}
	public void settId(Integer tId) {
		this.tId = tId;
	}
	@Override
	public String toString() {
		return "UserRel [uId=" + uId + ", tId=" + tId + "]";
	}
}
