package com.zd.video.serviceImpl.sys;

import com.zd.video.dao.sys.HistoryMapper;
import com.zd.video.po.sys.History;
import com.zd.video.service.sys.HistoryService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
@Service
public class HistoryServiceImpl implements HistoryService {

    @Resource
    HistoryMapper historyMapper;

    @Override
    @Transactional
    public List<History> selectByUserId(Integer userid) {
        try{
            return historyMapper.selectByUserId(userid);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    @Transactional
    public int insert(History record) {
        try{
            return historyMapper.insert(record);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public int insertSelective(History record) {
        try{
            return historyMapper.insertSelective(record);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public int deleteByUserId(Integer userid) {
        try{
            return historyMapper.deleteByUserId(userid);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public int deleteByVideoId(Integer videoid) {
        try{
            return historyMapper.deleteByVideoId(videoid);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public int deleteByExample(History history) {
        try{
            return historyMapper.deleteByExample(history);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }
}
