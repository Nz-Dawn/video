package com.zd.video.controller.sys;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zd.video.common.*;
import com.zd.video.service.sys.BranchService;
import com.zd.video.service.sys.RoleService;
import com.zd.video.service.sys.UserRelService;
import com.zd.video.service.sys.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.zd.video.po.sys.Branch;
import com.zd.video.po.sys.KeyVo;
import com.zd.video.po.sys.Log;
import com.zd.video.po.sys.Role;
import com.zd.video.po.sys.User;
import com.zd.video.po.sys.UserRel;

/**
 * 用户管理Controller
 * @author Maochao-zhu
 */
@Controller
@RequestMapping("/user")
public class UserController {
	protected Logger logger = LoggerFactory.getLogger(getClass());
	@Resource
    UserService userService;
	@Resource
    BranchService branchService;
	@Resource
    RoleService roleService;
	@Resource
    UserRelService userRelService;
	
	/**
	 * 去用户首页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("goIndex")
	 public ModelAndView goIndex(HttpServletRequest request,
	            HttpServletResponse response){
		ModelAndView modelView = new ModelAndView();
		modelView.addObject("keyList",branchService.getKeyList());
		List<Role> roleList = roleService.getRoleList(null);
		modelView.addObject("roleList", roleList);
		modelView.setViewName("views/user/index");
		return modelView; 
	}
	
	/**
	 * 去用户添加界面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("goAdd")
	 public ModelAndView goAdd(User User,HttpServletRequest request,HttpServletResponse response){

		ModelAndView modelView = new ModelAndView();
		//获取部门列表
		List<Branch> branchList = branchService.getBranchList(null);
		//获取角色列表
		 List<Role> roleList = roleService.getRoleList(null);
		 modelView.addObject("branchList", branchList);
		 modelView.addObject("roleList", roleList);
		 modelView.setViewName("views/user/add");
		 return modelView; 
	}
	
	/**
	 * 去编辑页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("goEdit")
	public ModelAndView goEdit(User User,Integer id,HttpServletRequest request,
			HttpServletResponse response){
		ModelAndView modelView = new ModelAndView();
		modelView.addObject("zx_data", userService.getUserById(id));
		
		//获取部门列表
		Branch branch = new Branch();
		List<Branch> branchList = branchService.getBranchList(branch);
		modelView.addObject("branchList", branchList);
		
		//获取角色列表
		List<Role> roleList = roleService.getRoleList(null);
		modelView.addObject("roleList", roleList);
		
		modelView.setViewName("views/user/edit");
		return modelView; 
	}
	
	
	/**
	 * 用户设定界面
	 * @param id
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("goUser")
	public ModelAndView goUser(Integer id,HttpServletRequest request,
			HttpServletResponse response){
		ModelAndView modelView = new ModelAndView();
		//用户信息
		User User = userService.getUserById(id);
		modelView.addObject("zx_data",User);
		modelView.setViewName("views/user/user");
		return modelView; 
	}
	
	@RequestMapping("goUserData")
	@ResponseBody
	 public BasePageData goUserData(User User, HttpServletRequest request,
                                    HttpServletResponse response){
		BasePageData data = new BasePageData();
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
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
	 public BasePageData getList(User user,HttpServletRequest request,
	            HttpServletResponse response){
		BasePageData data = new BasePageData();
		List<User> list = userService.getUserList(user);
		Integer count = userService.getUserListCount(user);
		
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		data.setCount(count); 
		data.setData(list);
		return data;
	}
	
	
	/**
	 * 保存用户
	 * @param User
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("insert")
	@ResponseBody
	 public BasePageData insert(User User,HttpServletRequest request,
	            HttpServletResponse response){
		BasePageData data = new BasePageData();
		data =userService.insertUser(User);
		User users= UserUtils.getLoginUser();
		if(null != data){
			userService.insertLog(users.getUname()+"添加用户信息");
		}
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
		 	//判断用户是否为系统保留
			User user= userService.getUserById(Integer.valueOf(s)); 
			if(null!=user && user.getType()==1){ 
				delFlag = true;
			}
		}
		//判断是否符合条件
		if(delFlag){
			data.setCode(WebResponseCode.FAIL);
			data.setMsg("系统保留用户,不能删除!");
			return data;
		}
		Integer del = userService.deleteUserById(ids);
		User users= UserUtils.getLoginUser();
		if(null != del){
			userService.insertLog(users.getUname()+"删除用户信息");
		}
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		return data;
	}
	
	/**
	 * 修改用户信息
	 * @param User
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("update")
	@ResponseBody
	public BasePageData update(User User,HttpServletRequest request,
			HttpServletResponse response){
		BasePageData data = new BasePageData();
		data =userService.updateUserById(User);
		User users= UserUtils.getLoginUser();
		if(null != data){
			userService.insertLog(users.getUname()+"修改用户信息");
		}
		return data;
	}
	
	
	/**
	 * 根据ID获取用户信息
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
		User User = userService.getUserById(id);
		data.setData(User);
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		return data;
	}
	
	/**
	 * 去日志列表界面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("goLogIndex")
	 public ModelAndView goLogIndex(HttpServletRequest request,
	            HttpServletResponse response){
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("views/user/log");
		return modelView; 
	}
	
	/**
	 * 获取日志列表
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("getLogList")
	@ResponseBody
	public BasePageData getLogList(Log log,HttpServletRequest request,
	            HttpServletResponse response){
		BasePageData data = new BasePageData();
		List<Log> list = userService.getLogList(log);
		Integer count = userService.getLogListCount(log);
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		data.setCount(count); 
		data.setData(list);
		return data;
	}
	
	/**
	 * 删除log
	 * @param id
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("deleteLog")
	@ResponseBody
	 public BasePageData deleteLog(String id,HttpServletRequest request,
	            HttpServletResponse response){
			BasePageData data = new BasePageData();
			String[] ids=id.split(",");
			userService.deleteLog(ids);
			data.setCode(WebResponseCode.SUCCESS);
			data.setMsg("操作成功!");
		return data;
	}
	
	//用户权限-显示
	@RequestMapping("goRole")
	public ModelAndView goRole(User User,Integer id,HttpServletRequest request,
			HttpServletResponse response){
		ModelAndView modelView = new ModelAndView();
		modelView.addObject("zx_data", userService.getUserById(id));
		
		//获取用户现有权限
		StringBuffer role_uid_str = new StringBuffer();
		List<UserRel> userRelList= userRelService.getUserRelListByUid(id);
		for (UserRel userRel : userRelList) {
			role_uid_str.append(userRel.gettId()+",");
		}
		modelView.addObject("role_uid_str", role_uid_str);
		
		//获取部门和部门下的用户
		ArrayList<Branch> branchUserList = new ArrayList<Branch>();
		List<KeyVo> keyList = branchService.getKeyList();
		for (KeyVo keyVo : keyList) {
			
			//根据ID获取部门 
			Branch branch_info = branchService.getBranchById((Integer) keyVo.getKey());
			
			//设置层级
			String branchName = (String) keyVo.getValue();
			branch_info.setLevel(StringUtil.appearNumber(branchName, "├─"));
			branch_info.setLevelName(branchName);
			
			//根据部门ID获取用户
			List<User> userList = userService.getUserListByBranchId((Integer) keyVo.getKey(),id);
			branch_info.setUserList(userList);
			
			branchUserList.add(branch_info);
		}
		modelView.addObject("branchUserList", branchUserList);
				
		modelView.setViewName("views/user/role");
		return modelView; 
	}
	
	//用户权限-设定
	@RequestMapping("updateRole")
	@ResponseBody
	public BasePageData updateRole(Integer id,String tids,HttpServletRequest request,
			HttpServletResponse response){
		
		BasePageData data = new BasePageData();
		
		//先删除关系
		userRelService.deleteUserRelByUid(id);
		
		//获取被管理的用户ID
		String tid_arr[] =tids.split(",");
		for (String tid : tid_arr) {
			//插入关系
			data = userRelService.insertUserRel(id, Integer.parseInt(tid));
		}
		
		User users= UserUtils.getLoginUser();
		if(null != data){
			userService.insertLog(users.getUname()+"修改用户权限");
		}
		return data;
	}


	/**
	 * 上传头像
	 * @param file
	 * @param id
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("uploadImage")
	@ResponseBody
	public BasePageData uploadImage(@RequestParam(value="file")MultipartFile file,
									@RequestParam(required=false,value="id")String  id,
									HttpServletRequest request,HttpServletResponse response){
		BasePageData data = new BasePageData();
		try {
			String filePath = FileUtil.uploadImage("userImage", file, request, response);
			if(null!=filePath){
				data.setCode(WebResponseCode.SUCCESS);
				data.setMsg(filePath);
			}else{
				data.setCode(WebResponseCode.FAIL);
				data.setMsg("上传失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			data.setCode(WebResponseCode.FAIL);
			data.setMsg("操作失败!");
		}
		return data;
	}

	//处理文件上传
	@RequestMapping(value="/uploadImage2", method = RequestMethod.POST)
	public @ResponseBody BasePageData uploadImg(@RequestParam("file") MultipartFile file,HttpServletRequest request, HttpServletResponse response) {
		BasePageData data = new BasePageData();
		try {
			String fileName = file.getOriginalFilename();
			//设置文件上传路径
			String filePath = request.getSession().getServletContext().getRealPath("imgupload/");
			System.out.println("############filePath"+filePath);
			if(null!=filePath){
				data.setCode(WebResponseCode.SUCCESS);
				data.setMsg(filePath);
			}else{
				data.setCode(WebResponseCode.FAIL);
				data.setMsg("上传失败");
			}
		} catch (Exception e) {
			e.printStackTrace();
			data.setCode(WebResponseCode.FAIL);
			data.setMsg("操作失败!");
		}
		return data;
	}
}
