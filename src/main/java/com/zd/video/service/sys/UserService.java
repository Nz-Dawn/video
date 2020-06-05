package com.zd.video.service.sys;

import java.util.List;
import java.util.Map;

import com.zd.video.common.BasePageData;
import com.zd.video.po.sys.Key;
import com.zd.video.po.sys.Log;
import com.zd.video.po.sys.User;

public interface UserService {
	public BasePageData insertUser(User user);
	public void insertUserList(List<User> list);
 
	public Integer deleteUserById(String[] ids);
	public BasePageData updateUserById(User user);
	public User getUserById(Integer id);
	public List<User> getUserList(User user);
	public Integer getUserListCount(User user);
	public Integer getUserByLoginName(String uname,Integer id);
	public User getUserByLogin(String uname);
	
	//根据部门获取部门下的用户
	public List<User> getUserListByBranchId(Integer bid,Integer uid);
	
	/**
	 * 获取日志列表
	 * @param log
	 * @return
	 */
	public List<Log> getLogList(Log log);
	public Integer getLogListCount(Log log);
	public Integer deleteLog(String[] ids);
	public Integer insertLog(String content);
	public Integer insertLogNoUser(Log log);
	//修改头像
	public void updateUserPhotoById(Integer id, String path);
	
	//获取键值对
	public List<Key> getKeyList(Key key);
	public Integer insertKey(Key key);
	public Integer updateKey(Key key);
	public Integer deleteKey(String key);
	public Key getKey(String key);
	public Integer getKeyListCount(Key key);
	/**
	 * @param uname
	 * @return
	 */
	public User selectUsersByUname(String uname);
	
	public List<Map<String, Object>> getDeptAndUserList(User user);
	
	public List<User> getUserBypid(Integer pid);
	public Integer getBugCountByTnameAndStatus(Integer status,String tname);
	public String getIdsByTnameAndStatus(Integer status,String tname);
	
	public List<User> getUserByBranchId(Integer branchId);
	
	public Integer getUserByTname(String tname);
	public String getDingUidByUserId(Integer userId);
	public Integer updateDingUidByUserId(String dingUid,Integer userId);
	//发送钉钉消息
	public void SendDingMessage(Integer userId,String singleTitle);
	public String getUserNamsByUserIds(String userIds);
}
