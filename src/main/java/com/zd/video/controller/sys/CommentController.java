package com.zd.video.controller.sys;

import com.zd.video.common.BasePageData;
import com.zd.video.common.UserUtils;
import com.zd.video.common.WebResponseCode;
import com.zd.video.po.sys.Comment;
import com.zd.video.po.sys.User;
import com.zd.video.service.sys.CommentService;
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
@RequestMapping("/sys/comment/")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @RequestMapping("goIndex")
    public ModelAndView goIndex(HttpServletRequest request, HttpServletResponse response){
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("views/comment/index");
        return modelView;
    }

    /**
     * 去评论添加界面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("goAdd")
    public ModelAndView goAdd(Comment comment, HttpServletRequest request,
                              HttpServletResponse response){
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("views/comment/add");
        return modelView;
    }

    /**
     * 去评论添加界面
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("publish")
    public ModelAndView publish(Comment comment, HttpServletRequest request,
                              HttpServletResponse response){
        ModelAndView modelView = new ModelAndView();
        User user = UserUtils.getLoginUser();
        comment.setUserid(user.getId());
        comment.setUsername(user.getUname());
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String now = sdf.format(date);
        comment.setCreatetime(now);
        try {
            Integer insert = commentService.insertSelective(comment);
        }catch (Exception e){
            e.printStackTrace();
        }
        modelView.addObject("id",comment.getTovideoid());
        modelView.setViewName("redirect:/census/goplay");
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
        modelView.addObject("zx_data", commentService.selectByPrimaryKey(id));
        modelView.setViewName("views/comment/edit");
        return modelView;
    }

    @RequestMapping("goCommentData")
    @ResponseBody
    public BasePageData goCategoryData(Comment comment, HttpServletRequest request,
                                       HttpServletResponse response){
        BasePageData data = new BasePageData();
        data.setCode(WebResponseCode.SUCCESS);
        data.setMsg("操作成功!");
        data.setData(commentService.selectAllComment());
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
    public BasePageData getList(Comment comment,HttpServletRequest request,
                                HttpServletResponse response){
        BasePageData data = new BasePageData();
        List<Comment> list = commentService.selectAllComment();
        Integer count = commentService.getCommentListCount();
        data.setCode(WebResponseCode.SUCCESS);
        data.setMsg("操作成功!");
        data.setCount(count);
        data.setData(list);
        return data;
    }


    /**
     * 保存评论
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("insert")
    @ResponseBody
    public BasePageData insert(Comment comment,HttpServletRequest request,
                               HttpServletResponse response){
        Date now = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = sdf.format(now);
        comment.setCreatetime(date);
        BasePageData data = new BasePageData();
        Integer ins = commentService.insertSelective(comment);
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
        try {
            String[] ids = id.split(",");
            for (int i = 0; i < ids.length; i++) {
                Integer isd = Integer.parseInt(ids[i]);
                Integer del = commentService.deleteByPrimaryKey(isd);
            }
            data.setCode(WebResponseCode.SUCCESS);
            data.setMsg("操作成功!");
            return data;
        }catch (Exception e){
            data.setCode(WebResponseCode.FAIL);
            data.setMsg("操作失败!");
            e.printStackTrace();
            return data;
        }
    }

    @RequestMapping("update")
    @ResponseBody
    public BasePageData update(Comment comment,HttpServletRequest request,
                               HttpServletResponse response){
        BasePageData data = new BasePageData();
        Integer upd = commentService.updateByPrimaryKeySelective(comment);
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
        Comment comment = commentService.selectByPrimaryKey(id);
        data.setData(comment);
        data.setCode(WebResponseCode.SUCCESS);
        data.setMsg("操作成功!");
        return data;
    }
}
