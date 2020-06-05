package com.zd.video.controller.sys;
import com.zd.video.common.*;
import com.zd.video.po.sys.Menu;
import com.zd.video.po.sys.User;
import com.zd.video.service.sys.MenuService;
import com.zd.video.service.sys.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * 首页跳转
 * @author Maochao-zhu
 */
@Controller
public class LoginController {
	protected Logger logger = LoggerFactory.getLogger(getClass());
	@Resource
    UserService userService;
	@Resource
	MenuService menuService;

	/**
	 * 去系统主页面
	 * @return
	 */
	@RequestMapping("sysIndex")
	public ModelAndView sysIndex(){
		ModelAndView modelView = new ModelAndView();
		User loginUser = UserUtils.getLoginUser();
		String cname="";
		if(null!=loginUser && loginUser.getType()==1){
			cname=null;
		}else{
			cname="MENU";
		}
		//获取菜单列表
		List<Menu> menuList = menuService.getMenuLeft(cname);
		modelView.addObject("menuList", menuList);
		modelView.setViewName("views/sys/sysIndex");
       return modelView;
	}


	/**
	 * 系统默认页面（去登录页面）
	 * @return
	 */
	@RequestMapping("/")
	 public ModelAndView goLogin(){
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("views/sys/login");
    return modelView;
	}
	/**
	 * 系统默认页面（去注册页面）
	 * @return
	 */
	@RequestMapping("/toregister")
	public ModelAndView goRegister(){
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("views/sys/register");
		return modelView;
	}
	@RequestMapping("/register")
	@ResponseBody
	public BasePageData register(String username, String password){
		BasePageData data = new BasePageData();
		User user =  new User();
		try {
			User u = userService.selectUsersByUname(username);
			if(u != null){
				data.setCode(WebResponseCode.FAIL);
				data.setMsg("用户名已存在");
				return data;
			}
			user.setType(2);
			user.setStatus(2);
			user.setUname(username);
			user.setTname(username);
			user.setPwd(password);
			user.setRoleId(19);
			userService.insertUser(user);
			data.setCode(WebResponseCode.SUCCESS);
			data.setMsg("注册成功");
		}catch (Exception e){
			data.setCode(WebResponseCode.FAIL);
			data.setMsg("注册失败");
			e.printStackTrace();
			return data;
		}
		return data;
	}
	/**
	 * 去系统统计界面
	 * @return
	 */
	@RequestMapping("goIndex")
	public ModelAndView goIndex(){
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("views/index/index");
		return modelView;
	}

	/**
	 * 用户登录接口
	 * @param username 用户名称
	 * @param password 密码
	 * @param isRememberMe 是否记住我
	 * @return
	 */
    @RequestMapping(value = "login")
    @ResponseBody
    public BasePageData Login(String username, String password, String isRememberMe,
                              HttpServletRequest request, HttpServletResponse response){
    	BasePageData data = new BasePageData();
		// 从SecurityUtils里边创建一个 subject
		Subject subject = SecurityUtils.getSubject();
		// 在认证提交前准备 token（令牌）
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		// 执行认证登陆
		try {
			//---------------
			if(StringUtil.isNotBlank(isRememberMe) && isRememberMe.equals("on")){
				Cookie cookie1 =  new Cookie("isRememberMe",isRememberMe);
				cookie1.setMaxAge(60*60);
				response.addCookie(cookie1);
				Cookie cookie2 =  new Cookie("username",username);
				cookie2.setMaxAge(60*60);
				response.addCookie(cookie2);
				Cookie cookie3 =  new Cookie("password",password);
				cookie3.setMaxAge(60*60);
				response.addCookie(cookie3);
			}
			subject.login(token);
			data.setCode(WebResponseCode.SUCCESS);
			data.setMsg("登录成功!");
			userService.insertLog("从IP#"+getIpAddr(request)+"#登录系统");

		} catch (UnknownAccountException uae) {
			data.setCode(WebResponseCode.FAIL);
			data.setMsg("未知账户");
		} catch (IncorrectCredentialsException ice) {
			data.setCode(WebResponseCode.FAIL);
			data.setMsg("密码不正确");
		} catch (LockedAccountException lae) {
			data.setCode(WebResponseCode.FAIL);
			data.setMsg("账户已锁定");
		} catch (ExcessiveAttemptsException eae) {
			data.setCode(WebResponseCode.FAIL);
			data.setMsg("用户名或密码错误次数过多");
		} catch (AuthenticationException ae) {
			data.setCode(WebResponseCode.FAIL);
			data.setMsg("用户名或密码不正确");
		}
		if (subject.isAuthenticated()) {
			return data;
		} else {
			token.clear();
			return data;
		}
    }
    

	
	/**
	 * 退出
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelAndView modelView = new ModelAndView();
		User user =null;
		Subject subject = SecurityUtils.getSubject();
		if(null!=subject){
			user = (User) subject.getPrincipal();
			if(user !=null){
				logger.info("=======退出登录=logout======="+user.getUname());
				userService.insertLog("退出登录");
			}
			subject.logout();
		}
		modelView.setViewName("redirect:/");
		return modelView;
	}
	
	
	/**
	 * 去错误界面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "error", method = RequestMethod.GET)
	public ModelAndView error(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("views/error/error");
		return modelView;
	}
	
	/**
	 * 没找到404界面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "404", method = RequestMethod.GET)
	public ModelAndView error404(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("views/error/404");
		return modelView;
	}
	
	
	public String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");   
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {   
            ip = request.getHeader("Proxy-Client-IP");   
        }   
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {   
            ip = request.getHeader("WL-Proxy-Client-IP");   
        }   
        if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {   
            ip = request.getRemoteAddr();   
        }   
        return ip;   
    }
	
	
	/**
	 * 去修改密码界面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("goUpdatePwd")
	public ModelAndView goUpdatePwd(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("views/user/updatePwd");
		return modelView;
	}
	
	/**
	 * 用户修改密码
	 * @param id	用户id
	 * @param oldPwd	原密码
	 * @param newPwd	新密码
	 * @param newRepeatPwd	重复新密码
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("updatePwd")
	@ResponseBody
	public BasePageData updatePwd(Integer id, String oldPwd, String newPwd, String newRepeatPwd,
                                  HttpServletRequest request, HttpServletResponse response) {
		BasePageData data = new BasePageData();
		if (null==id || StringUtil.isBlank(oldPwd) || StringUtil.isBlank(newPwd) || StringUtil.isBlank(newRepeatPwd)) {
			data.setCode(WebResponseCode.FAIL);
			data.setMsg("修改密码参数不能为空,修改失败");
			return data;
		}
		
		if(!newPwd.equals(newRepeatPwd)){
			data.setCode(WebResponseCode.FAIL);
			data.setMsg("两次输入密码不一致,修改失败");
			return data;
		}
		
		User user = userService.getUserById(id);
		if(null!=user){
			if(Md5Util.isEqualPassWord(oldPwd, user.getPwd())){
				User userTemp = new User();
				userTemp.setId(id); 
				userTemp.setPwd(newPwd); 
				userService.updateUserById(userTemp);
				data.setCode(WebResponseCode.SUCCESS);
				data.setMsg("修改密码成功!");
				return data;
			}else{
				data.setCode(WebResponseCode.FAIL);
				data.setMsg("用户原密码不正确,修改失败");
				return data;
			}
		}else{
			data.setCode(WebResponseCode.FAIL);
			data.setMsg("系统异常");
			return data;
		}
	}
}
