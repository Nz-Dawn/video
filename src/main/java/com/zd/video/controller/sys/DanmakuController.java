package com.zd.video.controller.sys;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zd.video.common.UserUtils;
import com.zd.video.po.sys.Danmaku;
import com.zd.video.po.sys.User;
import com.zd.video.po.sys.jsDanmaku_v2;
import com.zd.video.service.sys.DanmakuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Controller
public class DanmakuController {
    @Autowired
    DanmakuService danmakuService;

    @RequestMapping("/SendDanmaku")
    @ResponseBody
    public String  sendDanmaku(Integer DanmakuVideoid, Integer DanmakuVideotime,
                               String DanmakuContent, String DanmakuColor,
                               Integer DanmakuType, Integer DanmakuSize,
                               HttpSession session, Model model) {
        Danmaku danmaku = new Danmaku();
        try {
            User user = UserUtils.getLoginUser();
            danmaku.setDanmakuSenderid(user.getId());
        }catch (Exception e) {
            //return null;
            danmaku.setDanmakuSenderid(0);
        }
        danmaku.setDanmakuVideoid(DanmakuVideoid);
        danmaku.setDanmakuVideotime(DanmakuVideotime);
        danmaku.setDanmakuStringTime();
        danmaku.setDanmakuContent(DanmakuContent);
        danmaku.setDanmakuColor(DanmakuColor);
        danmaku.setDanmakuType(DanmakuType);
        danmaku.setDanmakuSendtime(new Date());
        danmaku.setDanmakuFontsize(16);
        danmaku.setDanmakuStatus(0);
        danmaku.setDanmakuId(danmakuService.insertSelective(danmaku));
        String JsonDanmaku = JSON.toJSONString(danmaku);
        System.out.println("JsonDanmaku  :  "+JsonDanmaku);

        return JsonDanmaku;
    }

    //设置弹幕状态
    @RequestMapping("/setDanmakuStatus/{danmakuId}/{danmakuStatus}")
    @ResponseBody
    public String SetDanmakuStatus(@PathVariable("danmakuId")Integer danmakuId, @PathVariable("danmakuStatus")Integer danmakuStatus, HttpSession session)
    {
        try {
            Danmaku danmaku = new Danmaku();
            if(danmakuId != null && danmakuStatus != null ){
                danmaku.setDanmakuId(danmakuId);
                danmaku.setDanmakuStatus(danmakuStatus);
            }
            danmakuService.updateByPrimaryKeySelective(danmaku);
        }catch (Exception e) {
            System.out.println(e);
            return "failed";
        }
        return "successed";
    }

    //视频页面所需数据 Json获取
    @RequestMapping("/getDanmakuData/{videoId}.json")
    @ResponseBody
    @CrossOrigin
    public String getDanmakuData(@PathVariable("videoId")Integer videoId, HttpSession session)
    {
        List<Danmaku> danmakus = danmakuService.selectByVid(videoId);
        ArrayList<Object> DanmakuData = new ArrayList<Object>();
        DanmakuData.add(danmakus);
        int LoginUserId = 0;

        try {
            User user = UserUtils.getLoginUser();
            LoginUserId = user.getId();
            //获取屏蔽词和屏蔽弹幕
//            List<Shield> shields = shieldService.getVideoShieldDanmaku(LoginUserId);
//            DanmakuData.add(shields);
//            List<BanKeyword> banKeywords = banKeywordService.findMyBankeyword(LoginUserId);
//            DanmakuData.add(banKeywords);
        }catch (Exception e)
        {
            System.out.println(e);
        }
        String JsonDanmakuData = JSON.toJSONString(DanmakuData);
        return JsonDanmakuData;
    }

    @RequestMapping("/sendDanmakuByUrl/{id}")
    @ResponseBody
    public String sendDanmakuByUrl(@PathVariable("id")Integer id, String danmu )
    {
        System.out.println("弹幕信息:"+danmu);
        User user = UserUtils.getLoginUser();
        JSONObject jsonDanmaku = JSONObject.parseObject(danmu);
        Danmaku danmaku = new Danmaku();
        danmaku.setDanmakuVideoid(id);
//        danmaku.setDanmakuVideotime(jsonDanmaku.getInteger("time"));
        String videotime = jsonDanmaku.getString("time");
        if(videotime.equals("NaN")){
            Random random = new Random();
            Integer time = random.nextInt(50);
            danmaku.setDanmakuVideotime(time);
        }else{
            Integer time = Integer.parseInt(videotime);
            danmaku.setDanmakuVideotime(time);
        }
        danmaku.setDanmakuContent(jsonDanmaku.getString("text"));
        danmaku.setDanmakuColor(jsonDanmaku.getString("color"));
        danmaku.setDanmakuType(jsonDanmaku.getInteger("position"));
        danmaku.setDanmakuFontsize(jsonDanmaku.getInteger("size"));
        danmaku.setDanmakuSendtime(new Date());
        danmaku.setDanmakuStatus(0);
        //jsDanmaku jsDm = (jsDanmaku)JSON.parse(danmu);
        //System.out.println("对象==="+jsDm.toString());
        danmaku.setSender(user);
        danmaku.setDanmakuSenderid(user.getId());
        System.out.println(danmaku.toString());
        danmakuService.insertSelective(danmaku);
        return "success";
    }

    /**
     * 接收弹幕消息
     * @param id
     * @param session
     * @return
     */
    @RequestMapping("/getDanmakuDataByUrl/{id}")
    @ResponseBody
    public String getDanmakuDataByUrl(@PathVariable("id")Integer id, HttpSession session)
    {
        List<Danmaku> danmakus = danmakuService.selectByVid(id);
        ArrayList<Danmaku> danmakuArrayList = new ArrayList<>();
        int LoginUserId = 0;
        try {
            User user = UserUtils.getLoginUser();
            for (Danmaku danmaku:danmakus)
            {
                danmakuArrayList.add(danmaku);
            }
        }catch (Exception e) {
          System.out.println(e);
          danmakuArrayList = (ArrayList<Danmaku>) danmakus;
        }
        ArrayList<jsDanmaku_v2> jsDanmakuV2s = new ArrayList<>();
        for (Danmaku danmaku:danmakuArrayList)
        {
            jsDanmaku_v2 jsDmV2 = new jsDanmaku_v2();
            jsDmV2.setText(danmaku.getDanmakuContent());
            jsDmV2.setColor(danmaku.getDanmakuColor());
            jsDmV2.setPosition(danmaku.getDanmakuType());
            jsDmV2.setSize(danmaku.getDanmakuFontsize());
            jsDmV2.setTime(danmaku.getDanmakuVideotime());
            jsDanmakuV2s.add(jsDmV2);
        }
        return JSON.toJSONString(jsDanmakuV2s);
    }

}
