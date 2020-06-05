package com.zd.video.dao.sys;

import com.zd.video.po.sys.Comment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {
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