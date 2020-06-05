package com.zd.video.controller.sys;

import com.zd.video.common.BasePageData;
import com.zd.video.common.UserUtils;
import com.zd.video.common.WebResponseCode;
import com.zd.video.po.sys.PersonInfo;
import com.zd.video.po.sys.User;
import com.zd.video.service.sys.PersonInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/sys/person/")
public class PersonInfoController {
    @Autowired
    private PersonInfoService personInfoService;

    @RequestMapping("goIndex")
    public ModelAndView goIndex(HttpServletRequest request, HttpServletResponse response){
        ModelAndView modelView = new ModelAndView();
        modelView.setViewName("views/user/info");
        return modelView;
    }

    /**
     * 保存
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("insert")
    @ResponseBody
    public BasePageData insert(PersonInfo personInfo,HttpServletRequest request,
                               HttpServletResponse response){
        User user = UserUtils.getLoginUser();
        personInfo.setId(user.getId());
        BasePageData data = new BasePageData();
        Integer ins = personInfoService.insertSelective(personInfo);
        data.setCode(WebResponseCode.SUCCESS);
        data.setMsg("操作成功!");
        return data;
    }


    @RequestMapping("update")
    @ResponseBody
    public BasePageData update(PersonInfo personInfo, HttpServletRequest request,
                               HttpServletResponse response){
        BasePageData data = new BasePageData();
        Integer upd = personInfoService.updateByPrimaryKeySelective(personInfo);
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
        PersonInfo personInfo = personInfoService.selectByPrimaryKey(id);
        data.setData(personInfo);
        data.setCode(WebResponseCode.SUCCESS);
        data.setMsg("操作成功!");
        return data;
    }

    @RequestMapping("submit")
    @ResponseBody
    public Map submit(PersonInfo personInfo, HttpServletResponse response){
        //ModelAndView modelView = new ModelAndView();
        Map map = new HashMap();
        User user  =  UserUtils.getLoginUser();
        PersonInfo temp = personInfoService.selectByPrimaryKey(user.getId());
        try{
            if(temp != null){
                personInfoService.updateByPrimaryKeySelective(personInfo);
            }else{
                personInfo.setId(user.getId());
                personInfoService.insertSelective(personInfo);
            }
        }catch (Exception e){
            map.put("code",-1);
        }

        map.put("code",0);
        //modelView.setViewName("redirect:/self/center/info");
        return map;
    }

}
