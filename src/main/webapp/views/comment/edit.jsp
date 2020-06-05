<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>编辑评论信息</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="${ctxStatic}/layuiadmin/layui/css/layui.css" media="all">
</head>
	
<body>
<div class="layui-form" lay-filter="layuiadmin-form-admin" id="layuiadmin-form-admin" style="padding: 20px 30px 0 0;">
	<input type="hidden" name="id" value="${zx_data.id}" />
	<div class="layui-form-item">
		<label class="layui-form-label">发表人ID</label>
		<div class="layui-input-block">
			<input type="text" name="userid" value="${zx_data.userid}" lay-verify="required" placeholder="请输入发表人ID" class="layui-input">
		</div>
	</div>
	
<%--	<div class="layui-form-item">--%>
<%--		<label class="layui-form-label">接收人ID</label>--%>
<%--		<div class="layui-input-inline" style="width: 70.5%; height: 30px">--%>
<%--			<input name="touserid" class="layui-input"  placeholder="请添加接收人ID" value="${zx_data.touserid}">--%>
<%--		</div>--%>
<%--	</div>--%>
	<div class="layui-form-item">
		<label class="layui-form-label">视频ID</label>
		<div class="layui-input-block">
			<input type="text" name="tovideoid" value="${zx_data.tovideoid}" lay-verify="required" placeholder="请输入视频ID" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">发表人昵称</label>
		<div class="layui-input-block">
			<input type="text" name="username" value="${zx_data.username}" lay-verify="required" placeholder="请输入发表人昵称" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">评论内容</label>
		<div class="layui-input-block">
			<textarea type="text" name="comment" value="" lay-verify="required" placeholder="请输入评论内容" class="layui-input">${zx_data.comment}</textarea>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">创建时间</label>
		<div class="layui-input-block">
			<input type="date" name="createtime" value="${zx_data.createtime}" lay-verify="required" placeholder="请输入创建时间" class="layui-input">
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
</body>
</html>