package com.zd.video.controller.sys;

import com.alibaba.fastjson.JSONObject;
import com.zd.video.common.KitFileUtil;
import com.zd.video.common.UserUtils;
import com.zd.video.po.sys.*;
import com.zd.video.service.sys.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/self/center/")
public class SelfCenterController {
    @Autowired
    private UserService userService;

    @Autowired
    private CategoryService categoryService;
    @Autowired
    private VideoService videoService;
    @Autowired
    private HistoryService historyService;
    @Autowired
    private FavoriteService favoriteService;
    @Autowired
    private PersonInfoService personInfoService;
    @Autowired
    private BranchService branchService;

    @RequestMapping("video")
    public ModelAndView myVideo(){
        ModelAndView modelView = new ModelAndView();
        User user = UserUtils.getLoginUser();
        List<Video> videos = null;
        if(user != null){
             videos = videoService.selectByUserId(user.getId());
        }
        modelView.addObject("videos",videos);
        modelView.setViewName("views/previous/myvideos");
        return modelView;
    }

    /**
     * 去往历史记录页面
     * @return
     */
    @RequestMapping("history")
    public ModelAndView history(){
        ModelAndView modelView = new ModelAndView();
        User user = UserUtils.getLoginUser();
        List<History> list = historyService.selectByUserId(user.getId());
        List<Integer> ids = new ArrayList<>();
        if(list!=null && list.size()>0){
            for (History h: list) {
                ids.add(h.getVideoid());
            }
        }
        List<Video> videos = null;
        if(ids != null)
            videos =  videoService.selectByIds(ids);
        modelView.addObject("videos",videos);
        modelView.setViewName("views/previous/history");
        return modelView;
    }
    /**
     * 去往历史记录页面
     * @return
     */
    @RequestMapping("favorite")
    public ModelAndView favorite(){
        ModelAndView modelView = new ModelAndView();
        User user = UserUtils.getLoginUser();
        List<Favorite> list = favoriteService.selectByUserId(user.getId());
        List<Integer> ids = new ArrayList<>();
        if(list!=null && list.size()>0){
            for (Favorite h: list) {
                ids.add(h.getVideoid());
            }
        }
        List<Video> videos =null;
        if(ids != null){
            videos = videoService.selectByIds(ids);
        }
        modelView.addObject("videos",videos);
        modelView.setViewName("views/previous/favorite");
        return modelView;
    }
    /**
     * 清空我的收藏
     * @return
     */
    @RequestMapping("deleteAllFavorite")
    public ModelAndView deleteAllFavorite(){
        ModelAndView modelView = new ModelAndView();
        User user = UserUtils.getLoginUser();
        try {
            Integer delete = favoriteService.deleteByUserId(user.getId());
        }catch (Exception e){
            modelView.addObject("error","清空数据失败");
            e.printStackTrace();
        }
        modelView.addObject("msg","清空数据成功");
        modelView.setViewName("views/previous/myvideos");
        return modelView;
    }
    /**
     * 清空浏览记录
     * @return
     */
    @RequestMapping("deleteAllHistory")
    public ModelAndView deleteAllHistory(){
        ModelAndView modelView = new ModelAndView();
        User user = UserUtils.getLoginUser();
        try {
            Integer delete = historyService.deleteByUserId(user.getId());
        }catch (Exception e){
            modelView.addObject("error","清空数据失败");
            e.printStackTrace();
        }
        modelView.addObject("msg","清空数据成功");
        modelView.setViewName("views/previous/history");
        return modelView;
    }
    @RequestMapping("info")
    public ModelAndView info(){
        ModelAndView modelView = new ModelAndView();
        User user = UserUtils.getLoginUser();
        user = userService.getUserById(user.getId());
        PersonInfo zx_data = personInfoService.selectByPrimaryKey(user.getId());
        if(zx_data != null){
            modelView.addObject("zx_data",zx_data);
        }
        //Branch branch_data = branchService.
        modelView.addObject("user",user);
        modelView.setViewName("views/user/info");
        return modelView;
    }

    @RequestMapping(value = "/uploadVideo",method = RequestMethod.POST)
    @ResponseBody
    public Object uploadVideo(@RequestParam("layuiVideo") MultipartFile[] layuiFile, HttpServletRequest request, HttpServletResponse response){
        System.out.println("进入wph的layui视频上传接口------------------------------------->");
        Map<String,Object> map=new HashMap<>();
        Map<String,Object> map2=new HashMap<>();
        if(layuiFile != null){
            //Long maxsize = videoService.getFileMaxSize();
            Long maxsize = 999999999999999L;

            for (int i = 0; i < layuiFile.length; i++) {
                Long fileSize = layuiFile[i].getSize();
                if(fileSize > maxsize){
                    map2.put("error",5);
                    map2.put("message","您的权限不够，请收藏更多视频！");
                    return JSONObject.toJSON(map2);
                }
            }
        }
        KitFileUtil kitFileUtil=new KitFileUtil();
        map = kitFileUtil.kitFileUtil(layuiFile, request, response);
        String error = map.get("error").toString();
        if("101".equals(error)){
            map2.put("error",101);
            map2.put("message",map.get("message"));
            return map;
        }
        map2.put("error",0);
        String url[]=(String[])map.get("url");
        Long time = (Long) map.get("fileSize");
        map2.put("url",url[0]);
        map2.put("time",time);
        return JSONObject.toJSON(map2);
    }

    @RequestMapping("toUpload")
    public ModelAndView toUpload(){
        ModelAndView modelView = new ModelAndView();
        User user = UserUtils.getLoginUser();
        user = userService.getUserById(user.getId());
        modelView.addObject("user",user);
        List<Category> category = categoryService.selectAllCategory();
        modelView.addObject("categorys",category);
        modelView.setViewName("views/previous/upload");
        return modelView;
    }

    //跳转预览页面
    @RequestMapping(value = "goLook", method = RequestMethod.GET)
    public Object goLook(HttpServletRequest request, HttpSession session){
        ModelAndView mv = new ModelAndView();
        String classVideo = request.getParameter("classVideo");
        mv.addObject("kitG", classVideo);
        mv.setViewName("views/previous/detail");
        return mv;
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
            videos = new ArrayList<>();
            List<Video> v = videoService.selectByDesc(description);
            User user = UserUtils.getLoginUser();
            for (Video vi : v) {
                if(vi.getCreateuserid() == user.getId()){
                    videos.add(vi);
                }
            }
            modelView.addObject("videos",videos);
            modelView.setViewName("views/previous/videos");
            return modelView;
        }
    }
}
