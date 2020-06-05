package com.zd.video.service.sys;

import com.zd.video.po.sys.Favorite;

import java.util.List;

public interface FavoriteService {

    List<Favorite> selectByUserId (Integer userid);

    int insert(Favorite record);

    int insertSelective(Favorite record);

    int deleteByUserId(Integer userid);

    int deleteByVideoId(Integer videoid);

    List<Favorite> selectByVideoId(Integer videoid);

    int deleteByExample(Favorite favorite);

    List<Favorite> selectByExample(Favorite favorite);
}
