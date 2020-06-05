package com.zd.video.dao.sys;

import com.zd.video.po.sys.Danmaku;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface DanmakuMapper {
    int deleteByPrimaryKey(Integer danmakuId);

    int insert(Danmaku record);

    int insertSelective(Danmaku record);

    Danmaku selectByPrimaryKey(Integer danmakuId);

    int updateByPrimaryKeySelective(Danmaku record);

    int updateByPrimaryKey(Danmaku record);

    public List<Danmaku> selectAll ();

    public List<Danmaku> selectByVid(Integer danmakuVideoid);
}