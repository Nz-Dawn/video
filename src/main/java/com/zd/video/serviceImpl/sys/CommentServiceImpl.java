package com.zd.video.serviceImpl.sys;

import com.zd.video.dao.sys.CommentMapper;
import com.zd.video.po.sys.Comment;
import com.zd.video.service.sys.CommentService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
@Service
public class CommentServiceImpl implements CommentService {

    @Resource
    CommentMapper commentMapper;


    @Override
    @Transactional
    public int deleteByPrimaryKey(Integer id) {
        try{
            return commentMapper.deleteByPrimaryKey(id);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public int insert(Comment record) {
        try {
            return commentMapper.insert(record);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public int insertSelective(Comment record) {
        try{
            return commentMapper.insertSelective(record);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public Comment selectByPrimaryKey(Integer id) {
        try {
            return commentMapper.selectByPrimaryKey(id);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    @Transactional
    public List<Comment> selectAllComment() {
        try{
            return commentMapper.selectAllComment();
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    @Transactional
    public List<Comment> selectByUserId(Integer touserid) {
        try{
            return commentMapper.selectByUserId(touserid);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    @Transactional
    public List<Comment> selectByVideoId(Integer tovideoid) {
        try{
            return commentMapper.selectByVideoId(tovideoid);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    @Transactional
    public int updateByPrimaryKeySelective(Comment record) {
        try{
            return commentMapper.updateByPrimaryKeySelective(record);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public int updateByPrimaryKey(Comment record) {
        try{
            return commentMapper.updateByPrimaryKey(record);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public int getCommentListCount() {
        try{
            return commentMapper.getCommentListCount();
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }
}
