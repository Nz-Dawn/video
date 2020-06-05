package com.zd.video.service.sys;

import java.util.List;

import com.zd.video.po.sys.Role;

/**
 * 角色
 * @author Maochao-zhu
 *
 */
public interface RoleService {
	public Integer insertRole(Role role);
	public Integer deleteRoleById(String[] ids);
	public Integer updateRoleById(Role role);
	public Role getRoleById(Integer id);
	public List<Role> getRoleList(Role role);
	public Integer getRoleListCount(Role role);

}
