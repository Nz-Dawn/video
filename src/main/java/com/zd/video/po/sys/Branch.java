package com.zd.video.po.sys;

import java.util.List;

import com.zd.video.common.BasePo;

/**
 * 部门实体类信息
 * 
 * @author Maochao-zhu
 * 
 */
public class Branch extends BasePo {
	
	private String fitstMenu;	//一级菜单
	private String secondMenu;	//二级菜单
	private String therdMenu;	//三级菜单
	
	private Integer id;
	private Integer pid;
	private String name;	//菜单名称
	private String uname;	//联系人
	private String tel;		//电话
	private String info;	//备注
	private Integer morder;	//排序
	private Integer nopid;	//排除id=pid的情况
	
	private String tname;
	private Integer uId;
	
	
	public Integer getuId() {
		return uId;
	}
	public void setuId(Integer uId) {
		this.uId = uId;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	private List<User> userList;
	
	//部门层级
	private Integer level;
	private String levelName;
	public String getFitstMenu() {
		return fitstMenu;
	}
	public void setFitstMenu(String fitstMenu) {
		this.fitstMenu = fitstMenu;
	}
	public String getSecondMenu() {
		return secondMenu;
	}
	public void setSecondMenu(String secondMenu) {
		this.secondMenu = secondMenu;
	}
	public String getTherdMenu() {
		return therdMenu;
	}
	public void setTherdMenu(String therdMenu) {
		this.therdMenu = therdMenu;
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
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
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
	public Integer getNopid() {
		return nopid;
	}
	public void setNopid(Integer nopid) {
		this.nopid = nopid;
	}
	public List<User> getUserList() {
		return userList;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
	public String getLevelName() {
		return levelName;
	}
	public void setLevelName(String levelName) {
		this.levelName = levelName;
	}
	@Override
	public String toString() {
		return "Branch [fitstMenu=" + fitstMenu + ", secondMenu=" + secondMenu + ", therdMenu=" + therdMenu + ", id="
				+ id + ", pid=" + pid + ", name=" + name + ", uname=" + uname + ", tel=" + tel + ", info=" + info
				+ ", morder=" + morder + ", nopid=" + nopid + ", userList=" + userList + ", level=" + level
				+ ", levelName=" + levelName + "]";
	}
	
}
