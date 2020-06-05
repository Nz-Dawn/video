package com.zd.video.config;

import com.zd.video.common.Md5Util;
import com.zd.video.po.sys.Role;
import com.zd.video.po.sys.User;
import com.zd.video.service.sys.RoleService;
import com.zd.video.service.sys.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;


import javax.annotation.Resource;
/**
 * 描述：
 *      配置用户菜单权限
 */
public class CustomRealm extends AuthorizingRealm {
    @Resource
    private UserService userService;
    @Resource
    RoleService roleService;
    /**
     * 权限认证，即登录过后，每个身份不一定，对应的所能看的页面也不一样。
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        //获取登录的用户信息
        User user = (User)principalCollection.getPrimaryPrincipal();
        if(user!=null){
            SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();
            //获取用户角色、和菜单权限
            if(null!=user && null!=user.getRoleId()){
                Role role = roleService.getRoleById(user.getRoleId());
                info.addRole(role.getId().toString());//加入角色
                //添加菜单和按钮权限、
                info = addPermission(user, info);
            }else{
                info.addRole("-1000");//加入角色
                info.addStringPermission("-1000"); //加入权限
            }
            return info;
        }
        return null;
    }


    /**
     * 身份认证。即登录通过账号和密码验证登陆人的身份信息。
     * 获取即将需要认证的信息
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken token=(UsernamePasswordToken)authenticationToken;
        //通过表单接收的用户名
        String username=token.getUsername();
        String userPwd = new String((char[]) authenticationToken.getCredentials());
        if(username!=null&&!"".equals(username)){
            User user=userService.getUserByLogin(username);
            if(user!=null){
                if(Md5Util.isEqualPassWord(userPwd,user.getPwd())){
                    return new SimpleAuthenticationInfo(user,userPwd,getName());
                }else{
                    throw new AccountException("密码不正确");
                }
            }else{
                throw new AccountException("用户名不存在");
            }
        }
        System.out.println("认证失败");
        return null;
    }

    /**
     * 获取当前登录用户权限
     * @param user
     * @param info
     * @return
     */
    private SimpleAuthorizationInfo addPermission(User user,SimpleAuthorizationInfo info) {
        Role  role = roleService.getRoleById(user.getRoleId());
        if(null!=role && null!=role.getMenuControl() && !"".equals(role.getMenuControl())){
            String []menuArr=role.getMenuControl().split(",");
            //获取菜单和按钮权限、
            for(String m:menuArr){
                info.addStringPermission(m);
            }
            //添加按钮权限
            String []operArr=role.getOperControl().split(",");
            for(String m:operArr){
                info.addStringPermission(m);
            }
            if((menuArr ==null ||menuArr.length==0) && (operArr ==null || operArr.length==0)){
                info.addStringPermission("-1000");
            }
        }else{
            info.addStringPermission("-1000");
        }
        return info;
    }
}

