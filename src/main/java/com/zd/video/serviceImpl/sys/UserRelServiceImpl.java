package com.zd.video.serviceImpl.sys;

import java.util.List;
import javax.annotation.Resource;

import com.zd.video.dao.sys.UserRelDao;
import com.zd.video.service.sys.UserRelService;
import org.springframework.stereotype.Service;
import com.zd.video.common.BasePageData;
import com.zd.video.common.WebResponseCode;
import com.zd.video.po.sys.UserRel;

@Service("UserRelServiceImpl")
public class UserRelServiceImpl implements UserRelService {
	
	@Resource
    UserRelDao userRelDao;
	
	@Override
	public BasePageData insertUserRel(Integer uid, Integer tid) {
		
		BasePageData data = new BasePageData();
		
		userRelDao.insertUserRel(uid, tid);
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		
		return data;
	}

	@Override
	public Integer deleteUserRelByUid(Integer uid) {
		return userRelDao.deleteUserRelByUid(uid);
	}

	@Override
	public List<UserRel> getUserRelListByUid(Integer uid) {
		return userRelDao.getUserRelListByUid(uid);
	}

}
