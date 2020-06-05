package com.zd.video.controller.sys;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zd.video.common.BasePageData;
import com.zd.video.service.sys.MenuService;
import com.zd.video.service.sys.RoleService;
import com.zd.video.service.sys.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.zd.video.common.StringUtil;
import com.zd.video.common.UserUtils;
import com.zd.video.common.WebResponseCode;
import com.zd.video.po.sys.Role;
import com.zd.video.po.sys.User;

/**
 * 角色管理Controller
 *
 */
@Controller
@RequestMapping("/role")
public class RoleController {
	protected Logger logger = LoggerFactory.getLogger(getClass());
	@Resource
    RoleService roleService;
	@Resource
    MenuService menuService;
	@Resource
    UserService userService;
	
	/**
	 * 去角色首页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("goIndex")
	 public ModelAndView goIndex(HttpServletRequest request,
	            HttpServletResponse response){
		ModelAndView modelView = new ModelAndView();
       modelView.setViewName("views/role/index");
       return modelView; 
	}
	
	/**
	 * 去角色添加界面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("goAdd")
	 public ModelAndView goAdd(Role role,HttpServletRequest request,
	            HttpServletResponse response){
		ModelAndView modelView = new ModelAndView(); 
       modelView.setViewName("views/role/add");
    return modelView; 
	}
	
	/**
	 * 去编辑页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("goEdit")
	public ModelAndView goEdit(Role Role,Integer id,HttpServletRequest request,
			HttpServletResponse response){
		ModelAndView modelView = new ModelAndView();
		modelView.addObject("zx_data", roleService.getRoleById(id));
		modelView.setViewName("views/role/edit");
		return modelView; 
	}
	
	
	/**
	 * 角色设定界面
	 * @param Role
	 * @param id
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("goRole")
	public ModelAndView goRole(Integer id,HttpServletRequest request,
			HttpServletResponse response){
		ModelAndView modelView = new ModelAndView();
		//角色信息
		Role role = roleService.getRoleById(id);
		modelView.addObject("zx_data",role);
		//菜单信息
		modelView.addObject("menuList", menuService.getMenuListAll());
		modelView.setViewName("views/role/role");
		return modelView; 
	}
	
	@RequestMapping("goRoleData")
	@ResponseBody
	 public BasePageData goRoleData(Role role, HttpServletRequest request,
                                    HttpServletResponse response){
		BasePageData data = new BasePageData();
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		data.setData(menuService.getMenuListAll());
		return data;
	}
	
	/**
	 * 获取数据列表信息
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("getList")
	@ResponseBody
	 public BasePageData getList(Role role,HttpServletRequest request,
	            HttpServletResponse response){
		BasePageData data = new BasePageData();
		List<Role> list = roleService.getRoleList(role);
		Integer count = roleService.getRoleListCount(role);
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		data.setCount(count); 
		data.setData(list);
		return data;
	}
	
	
	/**
	 * 保存角色
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("insert")
	@ResponseBody
	 public BasePageData insert(Role role,HttpServletRequest request,
	            HttpServletResponse response){
		BasePageData data = new BasePageData();
		Integer ins = roleService.insertRole(role);
		User users= UserUtils.getLoginUser();
		if(null != ins){
			userService.insertLog(users.getUname()+"添加角色信息");
		}
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		return data;
	}
	
	/**
	 * 删除操作
	 * @param id 字符串id
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("delete")
	@ResponseBody
	 public BasePageData delete(String id,HttpServletRequest request,
	            HttpServletResponse response){
		BasePageData data = new BasePageData();
		String[] ids=id.split(",");
		boolean delFlag = false;
		for(String s:ids){
		 	//判断角色是否为系统保留
			Role role= roleService.getRoleById(Integer.valueOf(s)); 
			if(null!=role && role.getType().equals("1")){ 
				delFlag = true;
			}
		}
		
		//判断是否符合条件
		if(delFlag){
			data.setCode(WebResponseCode.FAIL);
			data.setMsg("系统保留角色,不能删除!");
			return data;
		}
		Integer del = roleService.deleteRoleById(ids);
		User users= UserUtils.getLoginUser();
		if(null != del){
			userService.insertLog(users.getUname()+"删除角色信息");
		}
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		return data;
	}

	@RequestMapping("update")
	@ResponseBody
	public BasePageData update(Role role,HttpServletRequest request,
			HttpServletResponse response){
		BasePageData data = new BasePageData();
		Integer upd = roleService.updateRoleById(role);
		User users= UserUtils.getLoginUser();
		if(null != upd){
			userService.insertLog(users.getUname()+"修改角色信息");
		}
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		return data;
	}

	/**
	 * 角色设定
	 * @param roleId
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("updateRole")
	@ResponseBody
	public BasePageData updateRole(Integer roleId,HttpServletRequest request,
			HttpServletResponse response){
		BasePageData data = new BasePageData();
		Role role = new Role();
		role.setId(roleId);
		String ids = request.getParameter("idsTemp");
		String roleInfos = request.getParameter("roleInfosTemp");
		if(StringUtil.isNotBlank(ids)){
			ids = ids.substring(0, ids.length()-1);	
			role.setMenuControl(ids); 
		}
		if(StringUtil.isNotBlank(roleInfos)){ 
			roleInfos = roleInfos.substring(0, roleInfos.length()-1);	
			role.setOperControl(roleInfos);
		}
		Integer upd = roleService.updateRoleById(role);
		User users= UserUtils.getLoginUser();
		if(null != upd){
			userService.insertLog(users.getUname()+"设定角色信息");
		}
		
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		return data;
	}
	
	
	/**
	 * 根据ID获取角色信息
	 * @param id
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("get")
	@ResponseBody
	public BasePageData get(Integer id,HttpServletRequest request,
			HttpServletResponse response){
		BasePageData data = new BasePageData();
		Role Role = roleService.getRoleById(id);
		data.setData(Role);
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		return data;
	}
}
