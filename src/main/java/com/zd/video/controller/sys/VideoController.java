package com.zd.video.controller.sys;

import com.zd.video.common.UserUtils;
import com.zd.video.po.sys.User;
import com.zd.video.po.sys.Video;
import com.zd.video.service.sys.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/video/")
public class VideoController {
    @Autowired
    private VideoService videoService;

    /**
     * 上传视频控制器
     * @param request
     * @param video
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public Object videoAdd(HttpServletRequest request, Video video){
        ModelAndView mv = new ModelAndView();
        Date now = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = sdf.format(now);
        video.setCreatetime(date);
        User user = UserUtils.getLoginUser();
        if (user != null) {
            video.setCreateuserid(user.getId());
            video.setCreateuname(user.getUname());
        }
        Integer insert = videoService.insertSelective(video);
        if(insert>0){
            List<Video> myvideos = videoService.selectByUserId(user.getId());
            mv.addObject("videos",myvideos);
            mv.setViewName("views/previous/myvideos");
            return mv;
        }
        mv.addObject("message","上传失败！");
        mv.setViewName("views/previous/upload");
        return mv;
    }
    /**
     * 删除视频
     */
    @RequestMapping(value = "delete")
    public ModelAndView delete(HttpServletRequest request){
        ModelAndView mv = new ModelAndView("redirect:/self/center/video");
        String id = request.getParameter("id");
        try{
            Integer videoid = Integer.parseInt(id);
            videoService.deleteByPrimaryKey(videoid);
            mv.addObject("msg","删除成功");
        }catch (Exception e){
            mv.addObject("msg","删除失败");
            return mv;
        }
        return mv;
    }
}
