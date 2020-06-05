<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <title>注册 - 微视频平台</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <link rel="icon" href="${ctxStatic}/public/image/bitbug_favicon.ico" type="image/x-icon" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" type="text/css" href="${ctxStatic}/layuiadmin/layui/css/layui.css">
  <link rel="stylesheet" type="text/css" href="${ctxStatic}/layuiadmin/css/admin.css">
  <link rel="stylesheet" href="${ctxStatic}/layuiadmin/style/login.css" media="all">
  <script type="text/javascript" src="${ctxStatic}/public/js/jquery.js"></script>
  <script type="text/javascript" src="${ctxStatic}/public/js/jquery.form.js"></script>
</head>

<body> <!-- 背景图片样式 style="background: url(${ctxStatic}/public/image/login_img.jpg) no-repeat top center;background-size: cover;-webkit-background-size: cover;-o-background-size: cover;height: 100%;width: 100%;position: fixed;"> -->
<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
    <div class="layadmin-user-login-main">
        <div class="layadmin-user-login-box layadmin-user-login-header">
            <h2>微视频平台</h2>
            <p>springboot-video</p>
        </div>
        <form class="layui-form-item-login layui-form" id="infoForm">
            <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
                <div class="layui-form-item">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
                    <input type="text" name="username" id="LAY-user-login-username" lay-verify="required" placeholder="用户名" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
                    <input type="password" name="password" id="LAY-user-login-password" lay-verify="required" placeholder="密码" class="layui-input">
                </div>
                <div class="layui-form-items" style="margin-bottom: 20px;">
                    <input type="password" name="repassword" id="LAY-user-login-repassword" lay-verify="required"  placeholder="确认密码" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <button type="button" class="layui-btn layui-btn-normal layui-btn-fluid fa-registered" >注册</button>
                </div>
            </div>
        </form>
    </div>
</div>



<script type="text/javascript" src="${ctxStatic}/public/layui/layer/layer.js"></script>
<script type="text/javascript" src="${ctxStatic}/public/layui/layui.all.js"></script>
<script>
var cookies = document.cookie.split(";");
function getCK(mKey){
	for(var i=0;i<cookies.length;i++){
		var kv = cookies[i].split("=");
		if(kv[0].trim()==mKey){
			return kv[1].trim();
		}
	}
}
window.onload = function () {
	   if (window.parent.window != window) {  
	       window.top.location = "/";
	   }
	   var isRememberMe = getCK("isRememberMe");
	   var username = getCK("username");
	   var password = getCK("password");
	   if(isRememberMe=="on" && username!=null && username!=''){
		   var usernameInput = document.getElementById("LAY-user-login-username");
		   var passwordInput = document.getElementById("LAY-user-login-password");
		   var isRememberMeInput = document.getElementById("LAY-user-login-remember");
		   usernameInput.value=username;
		   passwordInput.value=password;
		   isRememberMeInput.checked = "checked"; 
		   layui.use(['form'], function() {
			   form = layui.form;
			   form.render("checkbox");
		   });
	   }
} 

	$(function() {
		$(".fa-registered").click(function(){
			var name = $("#LAY-user-login-username").val();
			var pwd  = $("#LAY-user-login-password").val();
			var repwd  = $("#LAY-user-login-repassword").val();
			if (name=='') {
				layer.msg('请输入用户名');
		   		return false;
			}
			if (pwd=='') {
				layer.msg('请输入密码');
			    return false;
			}
            if (repwd=='') {
                layer.msg('请确认密码');
                return false;
            }
            if (repwd!=pwd) {
                layer.msg('两次输入密码不一致');
                return false;
            }
			$('#infoForm').ajaxSubmit({
					type : 'post',
					url : '${ctxStatic}/register',
			        beforeSend: function(){
			            this.layerIndex = layer.load(1, {shade: [0.9,'xe63d']});
			        },
			        complete: function(){
			            layer.close(this.layerIndex);
			        } ,
			    	dataType: "json",
			       	success : function(data){
			       	console.log(data.msg);
		            if(data.code==0){ 
		               layer.msg(data.msg);
		               window.location.href = 'sysIndex';
		            }else{ 
		                 layer.msg(data.msg);
		            }
		        } 
			})
		});
	})
  </script>
</body>
</html>