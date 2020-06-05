package com.zd.video.dao.sys;

import java.util.List;

import com.zd.video.po.sys.Role;
import org.apache.ibatis.annotations.Mapper;

/**
 * 菜单操作
 * @author Maochao-zhu
 *
 */
@Mapper
public interface RoleDao {
	public Integer insertRole(Role role);
	public Integer deleteRoleById(String[] ids);
	public Integer updateRoleById(Role role);
	public Role getRoleById(Integer id);
	public List<Role> getRoleList(Role role);
	public Integer getRoleListCount(Role role);
	 
}
