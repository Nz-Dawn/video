package com.zd.video.po.sys;

import java.util.List;

/**
 * 菜单
 * 
 * @author Maochao-zhu
 * 
 */
public class Menu {
	private Integer id;
	private Integer pid;
	private String name;
	private String cname;
	private String url;
	private String img;
	private String role;
	private String info;
	private Integer morder;
	private List<KeyVo> voList;
	private List<Menu> childList;
	 
	
	public List<KeyVo> getVoList() {
		return voList;
	}
	public void setVoList(List<KeyVo> voList) {
		this.voList = voList;
	}
	public List<Menu> getChildList() {
		return childList;
	}
	public void setChildList(List<Menu> childList) {
		this.childList = childList;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Integer getMorder() {
		return morder;
	}
	public void setMorder(Integer morder) {
		this.morder = morder;
	}
}
