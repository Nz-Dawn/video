package com.zd.video.dao.sys;

import java.util.List;

import com.zd.video.po.sys.Menu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 菜单操作
 * @author Maochao-zhu
 *
 */
@Mapper
public interface MenuDao {
	public Integer insertMenu(Menu menu);
	public Integer deleteMenuById(String[] ids);
	public Integer updateMenuById(Menu menu);
	public Menu getMenuById(Integer id);
	public List<Menu> getMenuList(Menu menu);
	public List<Menu> getMenuListByPid(@Param("pid")Integer pid,@Param("cname")String cname);
	public Integer getMenuListCount(Menu menu);
	 
}
