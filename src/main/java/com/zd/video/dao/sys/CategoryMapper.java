package com.zd.video.dao.sys;

import com.zd.video.po.sys.Category;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryMapper {
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