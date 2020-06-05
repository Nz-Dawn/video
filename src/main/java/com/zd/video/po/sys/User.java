package com.zd.video.po.sys;

import java.io.Serializable;

import com.zd.video.common.BasePo;

/**
 * 用户信息
 * 
 * @author Maochao-zhu
 * 
 */
public class User extends BasePo implements Serializable {
	private static final long serialVersionUID = 1L; 
	private Integer id;
	private Integer type;//类型，1系统保留，2用户自建
	private Integer status;//状态：状态：0离职，1实习，2在职
	private String uname;//登录名
	private String tname;//真实姓名
	private String pwd;
	private String face;//头像
	private Integer branchId; //所属部门
	private Integer roleId;//所属角色
	private String branchName;//所属部门
	private String roleName;//所属部门
	private String unameTemp;//所属部门
	private Integer orderBy;//排序

	private String dingUid;//钉钉userId

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
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

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getFace() {
		return face;
	}

	public void setFace(String face) {
		this.face = face;
	}

	public Integer getBranchId() {
		return branchId;
	}

	public void setBranchId(Integer branchId) {
		this.branchId = branchId;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getUnameTemp() {
		return unameTemp;
	}

	public void setUnameTemp(String unameTemp) {
		this.unameTemp = unameTemp;
	}

	public Integer getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(Integer orderBy) {
		this.orderBy = orderBy;
	}

	public String getDingUid() {
		return dingUid;
	}

	public void setDingUid(String dingUid) {
		this.dingUid = dingUid;
	}
}
