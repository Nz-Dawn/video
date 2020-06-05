package com.zd.video.serviceImpl.sys;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.zd.video.dao.sys.BranchDao;
import com.zd.video.service.sys.BranchService;
import org.springframework.stereotype.Service;

import com.zd.video.po.sys.Branch;
import com.zd.video.po.sys.KeyVo;

/**
 * 部门Service实现类
 * @author Maochao-zhu
 *
 */
@Service("BranchServiceImpl")
public class BranchServiceImpl implements BranchService {
	
	@Resource
    BranchDao branchDao;
	
	@Override
	public Integer insertBranch(Branch branch) {
		// TODO Auto-generated method stub
		return branchDao.insertBranch(branch);
	}

	@Override
	public Integer deleteBranchById(String[] ids) {
		// TODO Auto-generated method stub
		return branchDao.deleteBranchById(ids);
	}

	@Override
	public Integer updateBranchById(Branch branch) {
		// TODO Auto-generated method stub
		return branchDao.updateBranchById(branch);
	}

	@Override
	public Branch getBranchById(Integer id) {
		// TODO Auto-generated method stub
		return branchDao.getBranchById(id);
	}

	@Override
	public List<Branch> getBranchList(Branch branch) {
		// TODO Auto-generated method stub
		return branchDao.getBranchList(branch);
	}

	public List<Map<String,Object>> getCustomerHead2Map(){
		return branchDao.getCustomerHead2Map();
	}
	public List<Map<String,Object>> getCustomerErpIdMap(){
		return branchDao.getCustomerErpIdMap();
	}
	
	@Override
	public Integer getBranchListCount(Branch branch) {
		// TODO Auto-generated method stub
		return branchDao.getBranchListCount(branch); 
	}

	public Integer getBranchCountByPid(String pid){
		return branchDao.getBranchCountByPid(pid);
	}
	
	public List<KeyVo> getKeyList() {
		List<KeyVo> linkList = new LinkedList<KeyVo>();
		Branch branch = new Branch();
		branch.setNopid(4); 
		List<Branch> list = branchDao.getBranchList(branch);
		List<KeyVo> linkListTemp = new LinkedList<KeyVo>();
		if(list.size()>0){
			List<KeyVo> typeList = new ArrayList<KeyVo>();
	    	//获取一级菜单
	    	for(Branch t1:list){
	    		KeyVo vo = new KeyVo();
	    		vo.setKey(t1.getId());
	    		vo.setPiKey(t1.getPid());
	    		vo.setValue(t1.getName());
	    		if(t1.getPid()==0){
	    			typeList.add(vo);
	    		}
	    		linkListTemp.add(vo);
	    	}
	    	//查询一级菜单下菜单
	    	for(KeyVo t:typeList){
	    		KeyVo vo1 = new KeyVo();
    			vo1.setKey(t.getKey());
    			vo1.setPiKey(t.getPiKey());
    			vo1.setValue(t.getValue());
	    		linkList.add(vo1);
	    		//获取子菜单
	    		List<KeyVo> childList =	getChildList(t.getKey(), linkListTemp);
	    		linkList.addAll(childList);
	    	}
		}
		return linkList;
	}
	
	//递归循环
	public  List<KeyVo> getChildList(Object key,List<KeyVo> list){
		List<KeyVo> KeyVoList = new LinkedList<KeyVo>();
    	//查询子菜单下是否还有菜单
		String flag = "├─";
		for(KeyVo t2:list){
			if(t2.getPiKey().equals(key)){
				KeyVo vo2 = new KeyVo();
				vo2.setKey(t2.getKey());
				vo2.setPiKey(t2.getPiKey()); 
				vo2.setValue(flag+t2.getValue());
				KeyVoList.add(vo2);
				//获取循环的值
				List<KeyVo> ls3= getChildList(t2.getKey(), list);
				if(null!=ls3 && ls3.size()>0){
					 for(KeyVo i:ls3){
						 	KeyVo vo3 = new KeyVo();
							vo3.setKey(i.getKey());
							vo3.setPiKey(i.getPiKey());
							vo3.setValue(flag+i.getValue());
							KeyVoList.add(vo3);
		    		}
    			}
			}
		}
		return KeyVoList;
	}

	/* 
	 * 导入部门信息
	 * (non-Javadoc)
	 * @see com.cn.auth.service.BranchService#importExcel(java.util.List)
	 */
	@Override
	public void importExcel(List<Branch> list) {
		// TODO Auto-generated method stub
		Integer id = null;
		Integer secondId = null;
		for(Branch b : list){
			if(null != b && b.getFitstMenu() != null){
				Branch branch = new Branch();
				//保存一级菜单
				branch.setPid(0);
				branch.setName(b.getFitstMenu());
				branch.setUname(b.getUname());
				branch.setTel(b.getTel());
				branch.setInfo(b.getInfo());
				branch.setMorder(0);
				branchDao.insertMenu(branch);
				id = branch.getId();
			}
			if(b.getFitstMenu() == null && b.getSecondMenu() != null){
				Branch bran = new Branch();
				//保存二级菜单
				bran.setPid(id);
				bran.setName(b.getSecondMenu());
				bran.setUname(b.getUname());
				bran.setTel(b.getTel());
				bran.setInfo(b.getInfo());
				bran.setMorder(1);
				branchDao.insertMenu(bran);
				secondId = bran.getId();
			}
			if(b.getFitstMenu() == null && b.getSecondMenu() == null && b.getTherdMenu() != null){
				Branch br = new Branch();
				//保存三级菜单
				br.setPid(secondId);
				br.setName(b.getTherdMenu());
				br.setUname(b.getUname());
				br.setTel(b.getTel());
				br.setInfo(b.getInfo());
				br.setMorder(2);
				branchDao.insertMenu(br);
			}
		}
	}

	@Override
	public Branch getBranchByErpId(String erpId) {
		// TODO Auto-generated method stub
		return branchDao.getBranchByErpId(erpId);
	}

	@Override
	public Branch getBranchByName(String name) {
		// TODO Auto-generated method stub
		return branchDao.getBranchByName(name);
	}

	@Override
	public List<Branch> getBranchByPid(Integer pid) {
		// TODO Auto-generated method stub
		return branchDao.getBranchByPid(pid);
	}
}
