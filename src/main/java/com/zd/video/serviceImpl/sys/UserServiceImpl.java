package com.zd.video.serviceImpl.sys;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import com.zd.video.common.*;
import com.zd.video.service.sys.UserService;
import org.springframework.stereotype.Service;
import com.zd.video.dao.sys.UserDao;
import com.zd.video.po.sys.Key;
import com.zd.video.po.sys.Log;
import com.zd.video.po.sys.User;

/**
 * Service实现类
 * @author Maochao-zhu
 *
 */
@Service
public class UserServiceImpl implements UserService {
	@Resource
	UserDao userDao;

	public void insertUserList(List<User> list){
		System.out.println("======【校验之前】的数量=========="+list.size());
		//校验数据问题
		for(int i=0;i<list.size();i++){
			Integer userCount = userDao.getUserByLoginName(list.get(i).getUname(),null); 
			//登录用户名重复
			if(null!=userCount && userCount>0){
				list.remove(i);
			}
		}
		System.out.println("======【校验之后】的数量=========="+list.size());
		userDao.insertUserList(list);
	}
	
	@Override
	public BasePageData insertUser(User user) {
		// TODO Auto-generated method stub
		BasePageData data = new BasePageData();
		//判断用户名称是否重复
		Integer userCount = userDao.getUserByLoginName(user.getUname(),null);
		if(null!=userCount && userCount>0){
			data.setMsg("登录用户名重复!");
			data.setCode(WebResponseCode.FAIL);
			return data;
		}
		
		//设置用户密码
		user.setPwd(Md5Util.getUserPassWord(user.getPwd()));
		Integer insertUserId = userDao.insertUser(user);
		data.setData(user.getId());
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		return data;
 
	}

	@Override
	public Integer deleteUserById(String[] ids) {
		// TODO Auto-generated method stub
		Integer deleteUserById = userDao.deleteUserById(ids);
		return deleteUserById;
	}

	@Override
	public BasePageData updateUserById(User user) {
		BasePageData data = new BasePageData();
		//判断用户名称是否重复
		Integer userCount = userDao.getUserByLoginName(user.getUname(),user.getId());
		if(null!=userCount && userCount>0){
			data.setMsg("登录用户名重复!");
			data.setCode(WebResponseCode.FAIL);
			return data;
		}
		//设置用户密码
		if(StringUtil.isNotBlank(user.getPwd())){
			user.setPwd(Md5Util.getUserPassWord(user.getPwd()));
		}
		userDao.updateUserById(user);
		data.setCode(WebResponseCode.SUCCESS);
		data.setMsg("操作成功!");
		// TODO Auto-generated method stub
		return data;
	}

	@Override
	public User getUserById(Integer id) {
		// TODO Auto-generated method stub
		return userDao.getUserById(id);
	}

	@Override
	public List<User> getUserList(User user) {
		// TODO Auto-generated method stub
		return userDao.getUserList(user);
	}
	
	//根据部门获取部门下的用户
	@Override
	public List<User> getUserListByBranchId(Integer bid,Integer uid) {
		return userDao.getUserListByBranchId(bid,uid);
	}

	@Override
	public Integer getUserListCount(User user) {
		return userDao.getUserListCount(user); 
	}

	@Override
	public Integer getUserByLoginName(String uname, Integer id) {
		// TODO Auto-generated method stub
		return userDao.getUserByLoginName(uname, id);
	}

	@Override
	public User getUserByLogin(String uname) {
		// TODO Auto-generated method stub
		return userDao.getUserByLogin(uname);
	}
	
	/**
	 * 获取日志列表
	 * @param log
	 * @return
	 */
	public List<Log> getLogList(Log log){
		 List<Log>  list = userDao.getLogList(log);
		 for(Log l:list){
			if(StringUtil.isNotBlank(l.getAddTime())){
				l.setAddTime(DateUtil.secondStrToDateStr(l.getAddTime()));
			}
		 }
		return list;
	}
	
	public Integer getLogListCount(Log log){
		return userDao.getLogListCount(log);
	}
	
	public Integer deleteLog(String[] ids){
		return userDao.deleteLog(ids);
	}
	
	public Integer insertLog(String content){

		Log log = new Log();
		log.setContent(content);
		User user = UserUtils.getLoginUser();
		if(null!=user && null!=user.getUname()){
			log.setUname(user.getUname());
			log.setTname(user.getTname());
		}else{
			log.setUname("系统管理员");
			log.setTname("系统管理员");
		}
		log.setAddTimeSecond(DateUtil.nowDateSecond());
		return userDao.insertLog(log);
	}
	
	public Integer insertLogNoUser(Log log){
		return userDao.insertLog(log);
	}

	@Override
	public void updateUserPhotoById(Integer id, String path) {
		// TODO Auto-generated method stub
		userDao.updateUserPhotoById(id,path);
	}
	
	//获取键值对
	public List<Key> getKeyList(Key key){
		return userDao.getKeyList(key);
	}
	public Integer insertKey(Key key){
		return userDao.insertKey(key);
	}
	public Integer updateKey(Key key){
		return userDao.updateKey(key);
	}
	public Integer deleteKey(String key){
		return userDao.deleteKey(key);
	}
	public Key getKey(String key){
		return userDao.getKey(key);
	}
	public Integer getKeyListCount(Key key){
		return userDao.getKeyListCount(key);
	}

	/* 根据当前登陆用户名查询当前用户id
	 * (non-Javadoc)
	 * @see com.cn.auth.service.UserService#selectUsersByUname(java.lang.String)
	 */
	@Override
	public User selectUsersByUname(String uname) {
		// TODO Auto-generated method stub
		return userDao.selectUsersByUname(uname);
	}

	@Override
	public List<Map<String, Object>> getDeptAndUserList(User user) {
		// TODO Auto-generated method stub
		return userDao.getDeptAndUserList(user);
	}

	@Override
	public List<User> getUserBypid(Integer pid) {
		return userDao.getUserBypid(pid);
	}

	@Override
	public Integer getBugCountByTnameAndStatus(Integer status, String tname) {
		return userDao.getBugCountByTnameAndStatus(status, tname);
	}

	@Override
	public String getIdsByTnameAndStatus(Integer status, String tname) {
		return userDao.getIdsByTnameAndStatus(status, tname);
	}
	
	public List<User> getUserByBranchId(Integer branchId){
		return userDao.getUserByBranchId(branchId);
	}
	
	public Integer getUserByTname(String tname){
		return userDao.getUserByTname(tname);
	}
	public String getDingUidByUserId(Integer userId){
		return userDao.getDingUidByUserId(userId);
	}
	
	public Integer updateDingUidByUserId(String dingUid,Integer userId){
		return userDao.updateDingUidByUserId(dingUid, userId);
	}
	
	public void SendDingMessage(Integer userId,String singleTitle){
		String dingUid = userDao.getDingUidByUserId(userId);
		if(StringUtil.isBlank(dingUid)){
			return;
		}
	}

	@Override
	public String getUserNamsByUserIds(String userIds) {
		// TODO Auto-generated method stub
		return userDao.getUserNamsByUserIds(userIds);
	}

}
