package com.zd.video.controller.census;
import com.zd.video.common.FileUtil;
import com.zd.video.common.UserUtils;
import com.zd.video.po.sys.*;
import com.zd.video.service.sys.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/census/")
public class IndexController {
    protected Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired
    private VideoService videoService;
    @Autowired
    private UserService userService;
    @Autowired
    private HistoryService historyService;
    @Autowired
    private FavoriteService favoriteService;

    @Autowired private CommentService commentService;
    /**
     * 去首页
     * @return
     */
//    @RequestMapping("goIndex")
//    public ModelAndView goIndex(){
//        ModelAndView modelView = new ModelAndView();
//        //跳转到首页统计图、在这里查询赋值、然后在页面展示就可以了
//        modelView.setViewName("views/census/index");
//        return modelView;
//    }

    /**
     * 去往视频主页
     * @return
     */
    @RequestMapping("goIndex")
    public ModelAndView goIndex(){
        ModelAndView modelView = new ModelAndView();

        //取全部小视频
        List<Video> videos = videoService.selectAllVideo();
        modelView.addObject("videos",videos);
        modelView.setViewName("views/previous/videos");
        return modelView;
    }

    /**
     * 搜索
     * @param request
     * @return
     */
    @RequestMapping("search")
    public ModelAndView search(HttpServletRequest request){
        ModelAndView modelView = new ModelAndView();
        String description = request.getParameter("description");
        List<Video> videos = null;
        if(description == null || description.equals("")){
            //取全部小视频
            videos = videoService.selectAllVideo();
            modelView.addObject("videos",videos);
            modelView.setViewName("views/previous/videos");
            return modelView;
        }else{
            videos = videoService.selectByDesc(description);
            modelView.addObject("videos",videos);
            modelView.setViewName("views/previous/videos");
            return modelView;
        }
    }
    @RequestMapping("goplay")
    public ModelAndView goPlay(HttpServletRequest request){
        ModelAndView modelView = new ModelAndView();
        User user = UserUtils.getLoginUser();
        String str = request.getParameter("id");
        if(str == null){
            modelView.setViewName("views/previous/play");
            modelView.addObject("message","播放错误");
            return modelView;
        }
        Integer id = Integer.parseInt(str);
        //添加到浏览记录
        History history = new History();
        history.setUserid(user.getId());
        history.setVideoid(id);
        try {
            Integer add = historyService.insert(history);
        }catch (Exception e){
            e.printStackTrace();
            modelView.addObject("error","添加到浏览记录失败");
        }
        //获取视频信息
        Video video=videoService.selectByPrimaryKey(id);
        //获取作者信息
        User author = userService.getUserById(video.getCreateuserid());
        //检查视频是否被收藏
        Favorite favorite = new Favorite();
        favorite.setVideoid(video.getId());
        favorite.setUserid(user.getId());
        List<Favorite> list  = favoriteService.selectByExample(favorite);
        if(list!=null && list.size()>0){
            modelView.addObject("isFavorite","true");
        }else{
            modelView.addObject("isFavorite","false");
        }
        //添加推荐小视频算法
        List<Video> suggestions = videoService.getSuggestions();
        modelView.addObject("suggestions",suggestions);
        modelView.addObject("author",author);
        modelView.addObject("video",video);
        modelView.setViewName("views/previous/play");
        //查找评论信息
        List<Comment> comments = commentService.selectByVideoId(video.getId());
        modelView.addObject("comments",comments);
        return modelView;
    }

    /**
     * 去往视频主页
     * @return
     */
    @RequestMapping("manage/video")
    public ModelAndView admin(){
        ModelAndView modelView = new ModelAndView();

        //取全部小视频
        List<Video> videos = videoService.selectAllVideo();
        modelView.addObject("videos",videos);
        modelView.setViewName("views/previous/admin-v");
        return modelView;
    }
    /**
     * 收藏
     * @return
     */
    @RequestMapping("manage/favorite")
    public ModelAndView favorite(HttpServletRequest request){
        ModelAndView modelView = new ModelAndView("redirect:/census/goplay");
        User user = UserUtils.getLoginUser();
        String vid = request.getParameter("vid");
        if(vid == null || vid.equals("")){
            modelView.addObject("error","收藏失败");
            return modelView;
        }
        modelView.addObject("id",vid);
        Integer videoid = Integer.parseInt(vid);
        Favorite favorite = new Favorite();
        favorite.setUserid(user.getId());
        favorite.setVideoid(videoid);
        Integer i =favoriteService.insert(favorite);
        if(i>0){
            modelView.addObject("msg","收藏成功");
        }
        return modelView;
    }
    /**
     * 收藏
     * @return
     */
    @RequestMapping("manage/cancelfavorite")
    public ModelAndView cancelfavorite(HttpServletRequest request){
        ModelAndView modelView = new ModelAndView("redirect:/census/goplay");
        User user = UserUtils.getLoginUser();
        String vid = request.getParameter("vid");
        if(vid == null || vid.equals("")){
            modelView.addObject("error","取消收藏失败");
            return modelView;
        }
        modelView.addObject("id",vid);
        Integer videoid = Integer.parseInt(vid);
        Favorite favorite = new Favorite();
        favorite.setUserid(user.getId());
        favorite.setVideoid(videoid);
        Integer i =favoriteService.deleteByExample(favorite);
        if(i>0){
            modelView.addObject("msg","取消收藏成功");
        }
        return modelView;
    }

    /**
     * 下载文件
     * @param filename
     * @throws IOException
     */
    @RequestMapping(value = "download")
    public void download(@RequestParam("fileName") String filename) throws IOException {
        ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletResponse response = requestAttributes.getResponse();
        // 设置信息给客户端不解析
        String type = new MimetypesFileTypeMap().getContentType(filename);
        // 设置contenttype，即告诉客户端所发送的数据属于什么类型
        response.setHeader("Content-type",type);
        // 设置编码
        String hehe = new String(filename.getBytes("utf-8"), "iso-8859-1");
        // 设置扩展头，当Content-Type 的类型为要下载的类型时 , 这个信息头会告诉浏览器这个文件的名字和类型。
        response.setHeader("Content-Disposition", "attachment;filename=" + hehe);
        FileUtil.download(filename, response);
    }
}
