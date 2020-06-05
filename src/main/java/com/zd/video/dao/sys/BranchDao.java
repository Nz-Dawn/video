package com.zd.video.dao.sys;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.zd.video.po.sys.Branch;

/**
 * 部门操作DAO
 * @author Maochao-zhu
 *
 */
@Mapper
public interface BranchDao {
	public Integer insertBranch(Branch branch);
	public Integer deleteBranchById(String[] ids);
	public Integer updateBranchById(Branch branch);
	public Branch getBranchById(Integer id);
	public List<Branch> getBranchList(Branch branch);
	public List<Map<String,Object>> getCustomerHead2Map();
	public List<Map<String,Object>> getCustomerErpIdMap();
	
	public Integer getBranchListCount(Branch branch);
	public Integer getBranchCountByPid(@Param("pid")String pid);
	//根据名称查询部门Id
	public Integer getBranchIdByName(@Param("name")String name);
	/**
	 * @param branch
	 * @return
	 */
	public Integer insertMenu(Branch branch);
	//根据erpID获取部门信息
	public Branch getBranchByErpId(@Param("erpId")String erpId);
	//根据部门name获取部门信息
	public Branch getBranchByName(@Param("name")String name);
    //根据部门id获取子部门信息
	public List<Branch> getBranchByPid(@Param("pid")Integer pid);
	
	 
}
