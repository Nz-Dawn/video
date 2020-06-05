package com.zd.video.controller.sys;

import com.zd.video.common.BasePageData;
import com.zd.video.common.WebResponseCode;
import com.zd.video.po.sys.Category;
import com.zd.video.service.sys.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/sys/category/")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    @RequestMapping("goIndex")
    public ModelAndView goIndex(HttpServletRequest request, HttpServletResponse response){
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("views/category/index");
        return modelView;
    }

    /**
     * 去分类添加添加界面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("goAdd")
    public ModelAndView goAdd(Category category, HttpServletRequest request,
                              HttpServletResponse response){
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("views/category/add");
        return modelView;
    }

    /**
     * 去编辑页面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("goEdit")
    public ModelAndView goEdit(Integer id,HttpServletRequest request,
                               HttpServletResponse response){
        ModelAndView modelView = new ModelAndView();
        modelView.addObject("zx_data", categoryService.selectByPrimaryKey(id));
        modelView.setViewName("views/category/edit");
        return modelView;
    }

    @RequestMapping("goCategoryData")
    @ResponseBody
    public BasePageData goCategoryData(Category category, HttpServletRequest request,
                                   HttpServletResponse response){
        BasePageData data = new BasePageData();
        data.setCode(WebResponseCode.SUCCESS);
        data.setMsg("操作成功!");
        data.setData(categoryService.selectAllCategory());
        return data;
    }

    /**
     * 获取数据列表信息
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("getList")
    @ResponseBody
    public BasePageData getList(Category category,HttpServletRequest request,
                                HttpServletResponse response){
        BasePageData data = new BasePageData();
        List<Category> list = categoryService.selectAllCategory();
        Integer count = categoryService.getCategoryListCount();
        data.setCode(WebResponseCode.SUCCESS);
        data.setMsg("操作成功!");
        data.setCount(count);
        data.setData(list);
        return data;
    }


    /**
     * 保存分类
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("insert")
    @ResponseBody
    public BasePageData insert(Category category,HttpServletRequest request,
                               HttpServletResponse response){
        Date now = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = sdf.format(now);
        category.setCreatetime(date);
        BasePageData data = new BasePageData();
        Integer ins = categoryService.insertSelective(category);
        data.setCode(WebResponseCode.SUCCESS);
        data.setMsg("操作成功!");
        return data;
    }

    /**
     * 删除操作
     * @param id 字符串id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("delete")
    @ResponseBody
    public BasePageData delete(String id,HttpServletRequest request,
                               HttpServletResponse response){
        BasePageData data = new BasePageData();
        String[] ids=id.split(",");
        Integer del = categoryService.deleteCategoryById(ids);
        data.setCode(WebResponseCode.SUCCESS);
        data.setMsg("操作成功!");
        return data;
    }

    @RequestMapping("update")
    @ResponseBody
    public BasePageData update(Category category,HttpServletRequest request,
                               HttpServletResponse response){
        BasePageData data = new BasePageData();
        Integer upd = categoryService.updateByPrimaryKeySelective(category);
        data.setCode(WebResponseCode.SUCCESS);
        data.setMsg("操作成功!");
        return data;
    }

    /**
     * 根据ID获取角色信息
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("get")
    @ResponseBody
    public BasePageData get(Integer id,HttpServletRequest request,
                            HttpServletResponse response){
        BasePageData data = new BasePageData();
        Category category = categoryService.selectByPrimaryKey(id);
        data.setData(category);
        data.setCode(WebResponseCode.SUCCESS);
        data.setMsg("操作成功!");
        return data;
    }
}
