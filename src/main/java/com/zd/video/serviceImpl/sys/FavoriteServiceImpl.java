package com.zd.video.serviceImpl.sys;

import com.zd.video.dao.sys.FavoriteMapper;
import com.zd.video.po.sys.Favorite;
import com.zd.video.service.sys.FavoriteService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class FavoriteServiceImpl implements FavoriteService {

    @Resource
    FavoriteMapper favoriteMapper;

    @Override
    @Transactional
    public List<Favorite> selectByUserId(Integer userid) {
        try{
            return favoriteMapper.selectByUserId(userid);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    @Transactional
    public int insert(Favorite record) {
        try{
            return favoriteMapper.insert(record);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public int insertSelective(Favorite record) {
        try{
            return favoriteMapper.insertSelective(record);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public int deleteByUserId(Integer userid) {
        try{
            return favoriteMapper.deleteByUserId(userid);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public int deleteByVideoId(Integer videoid) {
        try{
            return favoriteMapper.deleteByVideoId(videoid);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public List<Favorite> selectByVideoId(Integer videoid) {
        try{
            return favoriteMapper.selectByVideoId(videoid);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    @Transactional
    public int deleteByExample(Favorite favorite) {
        try{
            return favoriteMapper.deleteByExample(favorite);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public List<Favorite> selectByExample(Favorite favorite) {
        try{
            return favoriteMapper.selectByExample(favorite);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
