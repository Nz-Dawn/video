package com.zd.video.serviceImpl.sys;

import java.util.List;

import javax.annotation.Resource;

import com.zd.video.service.sys.RoleService;
import org.springframework.stereotype.Service;

import com.zd.video.dao.sys.RoleDao;
import com.zd.video.po.sys.Role;

/**
 * Service实现类
 * @author Maochao-zhu
 *
 */
@Service("RoleServiceImpl")
public class RoleServiceImpl implements RoleService {
	@Resource
	RoleDao roleDao;

	@Override
	public Integer insertRole(Role role) {
		// TODO Auto-generated method stub
		return roleDao.insertRole(role);
	}

	@Override
	public Integer deleteRoleById(String[] ids) {
		// TODO Auto-generated method stub
		return roleDao.deleteRoleById(ids);
	}

	@Override
	public Integer updateRoleById(Role role) {
		// TODO Auto-generated method stub
		return roleDao.updateRoleById(role);
	}

	@Override
	public Role getRoleById(Integer id) {
		// TODO Auto-generated method stub
		return roleDao.getRoleById(id);
	}

	@Override
	public List<Role> getRoleList(Role role) {
		// TODO Auto-generated method stub
		return roleDao.getRoleList(role);
	}

	@Override
	public Integer getRoleListCount(Role role) {
		return roleDao.getRoleListCount(role); 
	}
}
