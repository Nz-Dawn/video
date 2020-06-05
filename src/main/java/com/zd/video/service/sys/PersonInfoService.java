package com.zd.video.service.sys;

import com.zd.video.po.sys.PersonInfo;

public interface PersonInfoService {
    int deleteByPrimaryKey(Integer id);

    int insert(PersonInfo record);

    int insertSelective(PersonInfo record);

    PersonInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PersonInfo record);

    int updateByPrimaryKey(PersonInfo record);
}
