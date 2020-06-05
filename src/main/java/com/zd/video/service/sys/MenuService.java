package com.zd.video.service.sys;

import java.util.List;

import com.zd.video.po.sys.Menu;

/**
 * 菜单Service
 * @author Maochao-zhu
 *
 */
public interface MenuService {
	public Integer insertMenu(Menu menu);
	public Integer deleteMenuById(String[] ids);
	public Integer updateMenuById(Menu menu);
	public Menu getMenuById(Integer id);
	public List<Menu> getMenuList(Menu menu);
	public List<Menu> getMenuListAll();
	public Integer getMenuListCount(Menu menu);
	public List<Menu> getMenuLeft(String cname);

}
