package com.zd.video.serviceImpl.sys;

import com.zd.video.dao.sys.DanmakuMapper;
import com.zd.video.po.sys.Danmaku;
import com.zd.video.service.sys.DanmakuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DanmakuServiceImpl implements DanmakuService {
    @Autowired
    private DanmakuMapper danmakuMapper;

    @Override
    @Transactional
    public int deleteByPrimaryKey(Integer danmakuId) {
        try{
            return danmakuMapper.deleteByPrimaryKey(danmakuId);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public int insert(Danmaku record) {
        try{
            return danmakuMapper.insert(record);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public int insertSelective(Danmaku record) {
        try{
            return danmakuMapper.insertSelective(record);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public Danmaku selectByPrimaryKey(Integer danmakuId) {
        try{
            return danmakuMapper.selectByPrimaryKey(danmakuId);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    @Transactional
    public int updateByPrimaryKeySelective(Danmaku record) {
        try{
            return danmakuMapper.updateByPrimaryKeySelective(record);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public int updateByPrimaryKey(Danmaku record) {
        try{
            return danmakuMapper.updateByPrimaryKey(record);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public List<Danmaku> selectAll() {
        try{
            return danmakuMapper.selectAll();
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    @Transactional
    public List<Danmaku> selectByVid(Integer danmakuVideoid) {
        try{
            return danmakuMapper.selectByVid(danmakuVideoid);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
