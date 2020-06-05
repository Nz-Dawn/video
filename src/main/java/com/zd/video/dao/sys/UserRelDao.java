package com.zd.video.dao.sys;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import com.zd.video.po.sys.UserRel;
@Mapper
public interface UserRelDao {
	
	//插入关系
	public Integer insertUserRel(@Param("uid") Integer uid,@Param("tid") Integer tid);
	
	//删除关系
	public Integer deleteUserRelByUid(Integer uid);
	
	//根据用户ID获取被管理的人
	public List<UserRel> getUserRelListByUid(Integer uid);
}
