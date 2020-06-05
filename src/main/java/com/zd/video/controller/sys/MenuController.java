package com.zd.video.controller.sys;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.zd.video.common.BasePageData;
import com.zd.video.common.WebResponseCode;
import com.zd.video.po.sys.Menu;
import com.zd.video.service.sys.MenuService;
/**
 * 菜单管理Controller
 * @author Maochao-zhu
 *
 */
@Controller
@RequestMapping("/menu")
public class MenuController {
	protected Logger logger = LoggerFactory.getLogger(getClass());
	@Resource
	MenuService menuService;
	
	/**
	 * 去菜单首页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("goIndex")
	 public ModelAndView goIndex(HttpServletRequest request,
	            HttpServletResponse response){
		ModelAndView modelView = new ModelAndView();
       modelView.setViewName("views/menu/index");
       return modelView; 
	}
	
	/**
	 * 去菜单添加界面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("goAdd")
	 public ModelAndView goAdd(Menu menu,HttpServletRequest request,
	            HttpServletResponse response){
		ModelAndView modelView = new ModelAndView();
		menu.setPid(0); 
		List<Menu> parentMenuList = menuService.getMenuList(menu);
		modelView.addObject("menuList", parentMenuList);
       modelView.setViewName("views/menu/add");
    return modelView; 
	}
	
	/**
	 * 去编辑页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("goEdit")
	public ModelAndView goEdit(Menu menu,Integer id,HttpServletRequest request,
			HttpServletResponse response){
		ModelAndView modelView = new ModelAndView();
		menu.setPid(0); 
		List<Menu> parentMenuList = menuService.getMenuList(menu);
		modelView.addObject("menuList", parentMenuList);
		modelView.addObject("zx_data", menuService.getMenuById(id));
		modelView.setViewName("views/menu/edit");
		return modelView; 
	}
	
	
	/**
	 * 获取数据列表信息
	 * @param Menu
	 * @param config
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("getList")
	@ResponseBody
	 public BasePageData getList(Menu Menu,HttpServletRequest request,
	            HttpServletResponse response){
		BasePageData data = new BasePageData();
		List<Menu> list = menuService.getMenuList(Menu);
		Integer count = menuService.getMenuListCount(Menu);
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		data.setCount(count); 
		data.setData(list);
		return data;
	}
	
	
	/**
	 * 保存菜单
	 * @param Menu
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("insert")
	@ResponseBody
	 public BasePageData insert(Menu menu,HttpServletRequest request,
	            HttpServletResponse response){
		BasePageData data = new BasePageData();
		menuService.insertMenu(menu);
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
		 	//判断是否为父级菜单,如果是，而且有数据，不能删除，必须删除完下面的子菜单才可以删除父级菜单
			Menu menu= menuService.getMenuById(Integer.valueOf(s)); 
			if(null!=menu && null!=menu.getPid() && menu.getPid()==0){
				menu.setPid(menu.getId());
				Integer count =menuService.getMenuListCount(menu);
				if(null!=count && count>0){
					delFlag = true;
					break;
				}
			}
		}
		if(delFlag){
			data.setCode(WebResponseCode.FAIL);
			data.setMsg("操作失败,请先删除二级菜单!");
			return data;
		}
		menuService.deleteMenuById(ids);
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		return data;
	}

	@RequestMapping("update")
	@ResponseBody
	public BasePageData update(Menu Menu,HttpServletRequest request,
			HttpServletResponse response){
		BasePageData data = new BasePageData();
		menuService.updateMenuById(Menu);
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		return data;
	}
	
	
	/**
	 * 根据ID获取菜单信息
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
		Menu Menu = menuService.getMenuById(id);
		data.setData(Menu);
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		return data;
	}
}
