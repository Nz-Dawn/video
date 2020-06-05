package com.zd.video.dao.sys;

import com.zd.video.po.sys.Video;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface VideoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Video record);

    int insertSelective(Video record);

    Video selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Video record);

    int updateByPrimaryKey(Video record);

    public List<Video> selectByUserId(Integer id);

    public  List<Video> selectByCategory(Integer id);

    public List<Video> selectAllVideo();

    public List<Video> selectByDesc(String desception);

    public List<Video> selectByIds (List<Integer> ids);

    public List<Video> selectByCategorys (List<Integer> categorys);

    public List<Video> selectMyVideoByDesc(Video video);

}