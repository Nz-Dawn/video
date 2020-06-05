package com.zd.video.serviceImpl.sys;

import com.zd.video.dao.sys.CategoryMapper;
import com.zd.video.po.sys.Category;
import com.zd.video.service.sys.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        return categoryMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insert(Category record) {
        return categoryMapper.insert(record);
    }

    @Override
    public int insertSelective(Category record) {
        return categoryMapper.insertSelective(record);
    }

    @Override
    public Category selectByPrimaryKey(Integer id) {
        return categoryMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Category record) {
        return categoryMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Category record) {
        return categoryMapper.updateByPrimaryKey(record);
    }

    @Override
    public List<Category> selectAllCategory() {
        try {
            return categoryMapper.selectAllCategory();
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Integer getCategoryListCount() {
        return categoryMapper.getCategoryListCount();
    }

    @Override
    @Transactional
    public Integer deleteCategoryById(String[] ids){
        try{
            return categoryMapper.deleteCategoryById(ids);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
