package com.zd.video.controller.sys;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zd.video.common.BasePageData;
import com.zd.video.common.UserUtils;
import com.zd.video.common.WebResponseCode;
import com.zd.video.po.sys.Branch;
import com.zd.video.po.sys.User;
import com.zd.video.service.sys.BranchService;
import com.zd.video.service.sys.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 部门操作Controller
 * @author Maochao-zhu
 *
 */
@Controller
@RequestMapping("/branch")
public class BranchController {
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	@Resource
    BranchService branchService;
	@Resource
    UserService userService;
	
	/**
	 * 去部门首页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("goIndex")
	 public ModelAndView goIndex(HttpServletRequest request,
	            HttpServletResponse response){
		ModelAndView modelView = new ModelAndView();
        modelView.setViewName("views/branch/index");
     return modelView; 
	}
	
	
	/**
	 * 去部门添加界面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("goAdd")
	 public ModelAndView goAdd(HttpServletRequest request,
	            HttpServletResponse response){
		ModelAndView modelView = new ModelAndView();
		modelView.addObject("keyList",branchService.getKeyList());
        modelView.setViewName("views/branch/add");
        return modelView; 
	}
	
	/**
	 * 去编辑页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("goEdit")
	public ModelAndView goEdit(Integer id,HttpServletRequest request,
			HttpServletResponse response){
		ModelAndView modelView = new ModelAndView();
		modelView.addObject("zx_data", branchService.getBranchById(id));
		modelView.addObject("keyList",branchService.getKeyList());
		modelView.setViewName("views/branch/edit");
		return modelView; 
	}
	
	/**
	 * 获取数据列表信息
	 * @param branch
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("getList")
	@ResponseBody
	 public BasePageData getList(Branch branch, HttpServletRequest request,
                                 HttpServletResponse response){
		BasePageData data = new BasePageData();
		//过滤掉 ERP同步过来的部门
		branch.setNopid(4); // 列表显示过滤id= 4 和pid =4 的 部门
		List<Branch> list = branchService.getBranchList(branch);
		Integer count = branchService.getBranchListCount(branch);
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		data.setCount(count); 
		data.setData(list);
		return data;
	}

	/**
	 * 增加部门
	 * @param branch
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("insert")
	@ResponseBody
	 public BasePageData insert(Branch branch,HttpServletRequest request,
	            HttpServletResponse response){
		BasePageData data = new BasePageData();
		Integer ins = branchService.insertBranch(branch);
		User users= UserUtils.getLoginUser();
		if(null != ins){
			userService.insertLog(users.getUname()+"添加部门信息");
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
			if(s.equals("1") ){ //|| s.equals("2") 限制其他不能删除
				delFlag = true;
				break;
			}
			Integer count = branchService.getBranchCountByPid(s);
			if(null!=count && count>0){
				data.setCode(WebResponseCode.FAIL);
				data.setMsg("删除失败,请先删除子菜单!");
				return data;
			}
		}
		
		if(delFlag){
			data.setCode(WebResponseCode.FAIL);
			data.setMsg("操作失败,系统默认部门不能删除!");
			return data;
		}
		Integer del = branchService.deleteBranchById(ids);
		User users= UserUtils.getLoginUser();
		if(null != del){
			userService.insertLog(users.getUname()+"删除部门信息");
		}
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		return data;
	}

	/**
	 * 更新操作
	 * @param branch
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("update")
	@ResponseBody
	public BasePageData update(Branch branch,HttpServletRequest request,
			HttpServletResponse response){
		BasePageData data = new BasePageData();
		Integer upd = branchService.updateBranchById(branch);
		User users= UserUtils.getLoginUser();
		if(null != upd){
			userService.insertLog(users.getUname()+"修改部门信息");
		}
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		return data;
	}

	/**
	 * 跟据id获取部门
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
		Branch branch = branchService.getBranchById(id);
		data.setData(branch);
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		return data;
	}

}
