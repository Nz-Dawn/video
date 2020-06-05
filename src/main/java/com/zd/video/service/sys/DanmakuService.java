package com.zd.video.service.sys;

import com.zd.video.po.sys.Danmaku;

import java.util.List;

public interface DanmakuService {
    int deleteByPrimaryKey(Integer danmakuId);

    int insert(Danmaku record);

    int insertSelective(Danmaku record);

    Danmaku selectByPrimaryKey(Integer danmakuId);

    int updateByPrimaryKeySelective(Danmaku record);

    int updateByPrimaryKey(Danmaku record);

    public List<Danmaku> selectAll ();

    public List<Danmaku> selectByVid(Integer danmakuVideoid);
}
