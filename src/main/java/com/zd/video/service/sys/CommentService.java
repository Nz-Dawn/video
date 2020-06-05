package com.zd.video.service.sys;

import com.zd.video.po.sys.Comment;

import java.util.List;

public interface CommentService {
    int deleteByPrimaryKey(Integer id);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Integer id);

    List<Comment> selectAllComment ();

    List<Comment> selectByUserId (Integer touserid);

    List<Comment> selectByVideoId (Integer tovideoid);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);

    int getCommentListCount();
}
