package com.zd.video.po.sys;

import java.util.List;

/**
 * 树形菜单
 * @author Maochao-zhu
 *
 */
public class TreeVo {
	private Integer id; //菜单ID
	private Integer pid;//父类菜单ID
	private String label;//菜单标题
	private List<TreeVo> children; //子菜单列表
	
	public TreeVo() {
		super();
		// TODO Auto-generated constructor stub
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
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	public List<TreeVo> getChildren() {
		return children;
	}
	public void setChildren(List<TreeVo> children) {
		this.children = children;
	}
	
	
}
