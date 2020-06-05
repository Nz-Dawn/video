<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>添加分类</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="${ctxStatic}/layuiadmin/layui/css/layui.css" media="all">
</head>
	
<body>
<div class="layui-form" lay-filter="layuiadmin-form-admin" id="layuiadmin-form-admin" style="padding: 20px 30px 0 0;">
	<div class="layui-form-item">
		<label class="layui-form-label">分类名称</label>
		<div class="layui-input-block">
		<input type="text" name="name" value="" lay-verify="required" placeholder="请输入分类名称" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">类别描述</label>
		<div class="layui-input-inline" style="width: 70.5%; height: 30px">
			<textarea name="description" class="layui-textarea" placeholder="请添加类别描述内容"></textarea>
		</div>
	</div>
	<!-- <{:token('__token__', 'sha1')}> -->
	
	<div class="layui-form-item layui-hide">
		<input type="button" lay-submit lay-filter="ZX_iframe_submit" id="ZX_iframe_submit" value="确认">
	</div>
</div>
	
<script src="${ctxStatic}/layuiadmin/layui/layui.js"></script>  
<script>
layui.config({
	base: '${ctxStatic}/layuiadmin/' //静态资源所在路径
}).extend({
	index: 'lib/index' //主入口模块
}).use(['index', 'form'], function(){
	var $ = layui.$,
	form = layui.form;
})
</script>
<script type="text/javascript">
 layui.use(['layer', 'jquery', 'form'], function () {
		var layer = layui.layer,
				$ = layui.jquery,
				form = layui.form;
		$(document).on("click","#ZX_iframe_submit",function(){
			 $(this).attr("disabled","true"); //设置变灰按钮
			 setTimeout("$('#ZX_iframe_submit').removeAttr('disabled')",5000); //设置三秒后提交按钮 显示
			});
		
	});
</script>
</body>
</html>