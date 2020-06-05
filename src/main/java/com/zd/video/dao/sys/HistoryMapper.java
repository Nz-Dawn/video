package com.zd.video.dao.sys;

import com.zd.video.po.sys.History;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface HistoryMapper {
    List<History> selectByUserId (Integer userid);

    int insert(History record);

    int insertSelective(History record);

    int deleteByUserId(Integer userid);

    int deleteByVideoId(Integer videoid);

    int deleteByExample(History history);
}