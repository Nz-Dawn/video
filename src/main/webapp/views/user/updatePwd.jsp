<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>修改密码</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="icon" href="${ctxStatic}/public/image/bitbug_favicon.ico" type="image/x-icon" />
<link rel="SHORTCUT ICON" href="${ctxStatic}/public/image/bitbug_favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/public/layui/layui.css">
<link rel="stylesheet" href="${ctxStatic}/layuiadmin/layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css" href="${ctxStatic}/public/layui/laydate/laydate.css">
<link rel="stylesheet" type="text/css"  href="${ctxStatic}/public/css/style.css">
<script type="text/javascript" src="${ctxStatic}/public/js/jquery.js"></script>
<script type="text/javascript" src="${ctxStatic}/public/js/jquery.form.js"></script>
<script type="text/javascript" src="${ctxStatic}/public/js/common.js"></script>
<script type="text/javascript" src="${ctxStatic}/public/layui/layui.js"></script>
</head>

<body style="padding-top:20px">
<c:set var="oper_add" value="ADzxAdd"/> 
<div class="layui-fluid">
<div class="layui-row layui-col-space15">
  <div class="layui-col-md12">
    <div class="layui-card">
      <div class="layui-card-header">修改密码</div>
      <div class="layui-card-body" pad15>
        
        <div class="layui-form" lay-filter="">
        <input type="hidden" name="id" value="<shiro:principal property="id"/>">
            <div class="layui-form-item">
              <label class="layui-form-label">当前密码</label>
              <div class="layui-input-inline">
                <input type="password" name="oldPwd" lay-verify="pwd" lay-verify="required" class="layui-input">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">新密码</label>
              <div class="layui-input-inline">
                <input type="password" name="newPwd" id="newPwd" lay-verify="pwd" lay-verify="required" class="layui-input">
              </div>
            </div>
            <div class="layui-form-item">
              <label class="layui-form-label">确认新密码</label>
              <div class="layui-input-inline">
                <input type="password" name="newRepeatPwd" lay-verify="repwd" lay-verify="required" class="layui-input">
              </div>
            </div>
            <div class="layui-form-item">
              <div class="layui-input-block">
                <button class="layui-btn"  lay-submit lay-filter="ZX_iframe_submit" id="ZX_iframe_submit">确认</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript" src="${ctxStatic}/public/layui/layer/layer.js"></script>	
<script type="text/javascript" src="${ctxStatic}/public/layui/laydate/laydate.js"></script>
<script type="text/javascript" src="${ctxStatic}/public/layui/layui.all.js"></script>

<script type="text/javascript">
layui.use(['form'], function(){
	form = layui.form;
	form.verify({
		pwd: [
			/^[\S]{5,20}$/,
			'密码必须5到20位，且不能出现空格'
		],
		repwd:function(value){
            var pass = $('#newPwd').val();
            if(value != pass){
                return '两次密码不一致';
            }
        }
	});
	form.on('submit(ZX_iframe_submit)', function(data){
		var field = data.field;
		layui.layer.confirm('您确定要修改密码 ? 修改密码后将跳转到登录页.', function(index){
			$.ajax({
				type: "POST",
				url: 'updatePwd',
				data: field,
				dataType: "json",
				success: function(data){
					if(data.code==0){
						layer.msg(data.msg);
						parent.location.href = 'logout';
					}else{
						layer.msg(data.msg);
					}
				}
			});
		});
	});
});
</script>
</body>
</html>