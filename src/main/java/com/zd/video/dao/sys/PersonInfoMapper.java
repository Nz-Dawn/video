package com.zd.video.dao.sys;

import com.zd.video.po.sys.PersonInfo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PersonInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PersonInfo record);

    int insertSelective(PersonInfo record);

    PersonInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PersonInfo record);

    int updateByPrimaryKey(PersonInfo record);
}