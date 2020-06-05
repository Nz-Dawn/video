package com.zd.video.dao.sys;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.zd.video.po.sys.Key;
import com.zd.video.po.sys.Log;
import com.zd.video.po.sys.User;

/**
 * 数据关联DAO
 * @author Maochao-zhu
 *
 */
@Mapper
public interface UserDao {
	public Integer insertUser(User user);
	public Integer insertUserList(List<User> list);
	
	public Integer deleteUserById(String[] ids);
	public Integer updateUserById(User user);
	public User getUserById(Integer id);
	public List<User> getUserList(User user);
	public Integer getUserListCount(User user);
	public Integer getUserByLoginName(@Param("uname")String uname,@Param("id")Integer id);
	public User getUserByLogin(@Param("uname")String uname);
	public Integer getUserIdByName(@Param("name")String name);
	public List<User> checkUserLogin(@Param("uname")String username, @Param("pwd")String password);
	
	//根据部门获取部门下的用户
	public List<User> getUserListByBranchId(@Param("bid") Integer bid,@Param("uid")Integer uid);
	
	/**
	 * 获取日志列表
	 * @param log
	 * @return
	 */
	public List<Log> getLogList(Log log);
	public Integer getLogListCount(Log log);
	public Integer deleteLog(String[] ids);
	public Integer insertLog(Log log);
	//修改头像
	void updateUserPhotoById(@Param(value="id")Integer id, @Param(value="photo")String photo);
	
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
	public User selectUsersByUname(@Param("uname")String uname);
	public String getUserNameById(@Param("id")Integer id);
	
	public List<Map<String, Object>> getDeptAndUserList(User user);
	
	public List<User> getUserBypid(@Param("pid")Integer pid);
	//根据用户名和状态获取bug数
	public Integer getBugCountByTnameAndStatus(@Param("status")Integer status,@Param("tname")String tname);
	//根据用户名和状态获取部门Id
	public String getIdsByTnameAndStatus(@Param("status")Integer status,@Param("tname")String tname);
	
	public List<User> getUserByBranchId(@Param("branchId")Integer branchId); 
	
	public Integer getUserByTname(String tname);
	public String getDingUidByUserId(Integer userId);
	public Integer updateDingUidByUserId(@Param("dingUid")String dingUid,@Param("userId")Integer userId);
	public String getUserNamsByUserIds(@Param("userIds")String userIds);

	//插入钉钉推送内容
	public Integer insertDingNotice(@Param("userId")Integer userId,@Param("content")String content,@Param("result")String result);
}
