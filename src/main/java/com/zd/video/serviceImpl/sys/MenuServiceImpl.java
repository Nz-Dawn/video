package com.zd.video.serviceImpl.sys;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zd.video.dao.sys.MenuDao;
import com.zd.video.po.sys.KeyVo;
import com.zd.video.po.sys.Menu;
import com.zd.video.service.sys.MenuService;

/**
 * Service实现类
 * @author Maochao-zhu
 *
 */
@Service("MenuServiceImpl")
public class MenuServiceImpl implements MenuService {
	@Resource
	MenuDao menuDao;

	@Override
	public Integer insertMenu(Menu menu) {
		// TODO Auto-generated method stub
		return menuDao.insertMenu(menu);
	}

	@Override
	public Integer deleteMenuById(String[] ids) {
		// TODO Auto-generated method stub
		return menuDao.deleteMenuById(ids);
	}

	@Override
	public Integer updateMenuById(Menu menu) {
		// TODO Auto-generated method stub
		return menuDao.updateMenuById(menu);
	}

	@Override
	public Menu getMenuById(Integer id) {
		// TODO Auto-generated method stub
		return menuDao.getMenuById(id);
	}

	@Override
	public List<Menu> getMenuList(Menu menu) {
		// TODO Auto-generated method stub
		return menuDao.getMenuList(menu);
	}
	
	@Override
	public List<Menu> getMenuLeft(String cname){
		List<Menu> parentList = new ArrayList<Menu>();
		//一级菜单
		parentList = menuDao.getMenuListByPid(0,cname);
		for(Menu m : parentList){
			//二级菜单
			List<Menu> childList = menuDao.getMenuListByPid(m.getId(),cname);
			m.setChildList(childList);
		}
		return parentList;
	} 
	
	@Override
	public List<Menu> getMenuListAll(){
		List<Menu> parentList = new ArrayList<Menu>();
		//一级菜单
		parentList = menuDao.getMenuListByPid(0,null);
		for(Menu m : parentList){
			//二级菜单
			List<Menu> childList = menuDao.getMenuListByPid(m.getId(),null);
			for(Menu c:childList){
				 if(null!=c.getRole() && !"".equals(c.getRole())){
					 List<KeyVo> keyVoList = new ArrayList<KeyVo>();
					 String [] arr = c.getRole().split(",");
					 //二级菜单下的按钮
					 for(String a:arr){
						 if(null!=a){
							 String []arr2 = a.split(":");
							 if(arr2.length==2){
								 KeyVo vo = new KeyVo(); 
								 vo.setKey(arr2[0]);
								 vo.setValue(arr2[1]);
								 keyVoList.add(vo);
							 }
							
						 }
					 }
					 c.setVoList(keyVoList); 
				 }
			}
			m.setChildList(childList);
		}
		return parentList;
	}

	@Override
	public Integer getMenuListCount(Menu menu) {
		return menuDao.getMenuListCount(menu); 
	}
}
