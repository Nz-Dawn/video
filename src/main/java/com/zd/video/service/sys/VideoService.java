package com.zd.video.service.sys;


import com.zd.video.po.sys.Video;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface VideoService {
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

    public List<Video> getSuggestions();

    public List<Video> selectByCategorys (List<Integer> categorys);

    public List<Video> selectMyVideoByDesc(Video video);

    public Long  getFileMaxSize();
}
