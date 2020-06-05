package com.zd.video.po.sys;

/**
 * 角色
 * 
 * @author Maochao-zhu
 * 
 */
public class Role {
	private Integer id;
	private String type;//类型，1系统保留，2用户自建
	private String name;
	private String menuControl;//菜单权限
	private String operControl;//按钮权限
	private Integer morder;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMenuControl() {
		return menuControl;
	}
	public void setMenuControl(String menuControl) {
		this.menuControl = menuControl;
	}
	public String getOperControl() {
		return operControl;
	}
	public void setOperControl(String operControl) {
		this.operControl = operControl;
	}
	public Integer getMorder() {
		return morder;
	}
	public void setMorder(Integer morder) {
		this.morder = morder;
	}
}
