package com.zd.video.serviceImpl.sys;

import com.zd.video.dao.sys.PersonInfoMapper;
import com.zd.video.po.sys.PersonInfo;
import com.zd.video.service.sys.PersonInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class PersonInfoServiceImpl implements PersonInfoService {
    @Autowired
    private PersonInfoMapper personInfoMapper;
    @Override
    @Transactional
    public int deleteByPrimaryKey(Integer id) {
        try{
            return personInfoMapper.deleteByPrimaryKey(id);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public int insert(PersonInfo record) {
        try{
            return personInfoMapper.insert(record);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public int insertSelective(PersonInfo record) {
        try{
            return personInfoMapper.insertSelective(record);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public PersonInfo selectByPrimaryKey(Integer id) {
        try{
            return personInfoMapper.selectByPrimaryKey(id);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    @Transactional
    public int updateByPrimaryKeySelective(PersonInfo record) {
        try{
            return personInfoMapper.updateByPrimaryKeySelective(record);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public int updateByPrimaryKey(PersonInfo record) {
        try{
            return personInfoMapper.updateByPrimaryKey(record);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }
}
