package com.zd.video.common;

import java.util.ArrayList;
import java.util.List;

import com.zd.video.po.sys.KeyVo;
import com.zd.video.po.sys.TreeVo;

/**
 * 
 * 树形结构工具类
 * @author Maochao-zhu
 */
public class TreeUtil {
		/**
		 * 获取树形结构列表（包含子类列表children）
		 * @param list
		 * @return list
		 */
	    public static List<TreeVo> getTreeVolist(List<TreeVo> list){
	    	List<TreeVo> oneList = new ArrayList<TreeVo>();
	    	List<TreeVo> treeList = new ArrayList<TreeVo>();
	    	//获取一级菜单
	    	for(TreeVo t1:list){
	    		if(t1.getPid()==0){
	    			oneList.add(t1);
	    		}
	    	}
	    	//查询一级菜单下菜单
	    	for(TreeVo t:oneList){
	    		//获取子菜单
	    		List<TreeVo> childList =getTreeChildList(t.getId(), list);
	    		t.setChildren(childList);
	    		treeList.add(t);
	    	}
	    	return treeList;
	    }

	    
	    /**
	     * 获取字菜单列表
	     * @param id 
	     * @param list
	     * @return
	     */
	    public static List<TreeVo> getTreeChildList(Integer id,List<TreeVo> list){
	    	List<TreeVo> treeList = new ArrayList<TreeVo>();
	    	//查询子菜单下是否还有菜单
    		for(TreeVo t2:list){
    			if(t2.getPid()==id){
	    			t2.setChildren(getTreeChildList(t2.getId(), list));
	    			treeList.add(t2);
    			}
    		}
	    	return treeList;
	    }
	    
	    
		/**
		 * 获取树形结构列表（不包含子类列表children，返回字符串象形列表形式）
		 * @param list
		 * 列如：
		 * 	1级菜单
		 * 	├─2级菜单
		 * 	├─├─3级菜单
		 *  ├─├─├─4级菜单
		 * @return list
		 */
	    public static List<KeyVo> getKeyTree(List<KeyVo> list){
	    	return list;
	    }
}
