package com.zd.video.service.sys;

import com.zd.video.po.sys.History;

import java.util.List;

public interface HistoryService {

    List<History> selectByUserId (Integer userid);

    int insert(History record);

    int insertSelective(History record);

    int deleteByUserId(Integer userid);

    int deleteByVideoId(Integer videoid);

    int deleteByExample(History history);
}
