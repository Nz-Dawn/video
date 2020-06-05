package com.zd.video.service.sys;

import com.zd.video.po.sys.Category;

import java.util.List;

public interface CategoryService {
    int deleteByPrimaryKey(Integer id);

    int insert(Category record);

    int insertSelective(Category record);

    Category selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Category record);

    int updateByPrimaryKey(Category record);

    public List<Category> selectAllCategory();

    public Integer getCategoryListCount();

    public Integer deleteCategoryById(String[] ids);
}
