package com.zd.video.dao.sys;

import com.zd.video.po.sys.Favorite;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FavoriteMapper {
    List<Favorite> selectByUserId (Integer userid);

    int insert(Favorite record);

    int insertSelective(Favorite record);

    int deleteByUserId(Integer userid);

    int deleteByVideoId(Integer videoid);

    int deleteByExample(Favorite favorite);

    List<Favorite> selectByVideoId(Integer videoid);

    List<Favorite> selectByExample(Favorite favorite);
}