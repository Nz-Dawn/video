package com.zd.video.service.sys;

import java.util.List;
import java.util.Map;

import com.zd.video.po.sys.Branch;
import com.zd.video.po.sys.KeyVo;

/**
 * 部门Service
 * @author Maochao-zhu
 *
 */
public interface BranchService {
	public Integer insertBranch(Branch branch);
	public Integer deleteBranchById(String[] ids);
	public Integer updateBranchById(Branch branch);
	public Branch getBranchById(Integer id);
	public List<Branch> getBranchList(Branch branch);
	public List<Map<String,Object>> getCustomerHead2Map();
	public List<Map<String,Object>> getCustomerErpIdMap();
	
	public Integer getBranchListCount(Branch branch);
	public Integer getBranchCountByPid(String pid);
	public List<KeyVo> getKeyList();
	/**
	 * @param list
	 */
	public void importExcel(List<Branch> list);
	//根据erpID获取部门信息
	public Branch getBranchByErpId(String f_DLP_fhbm);
	
	//根据部门名称获取部门
	public Branch getBranchByName(String acceptBranchName);
	
	public List<Branch> getBranchByPid(Integer pid);
}
