<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>layuiAdmin 管理员 iframe 框</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="${ctxStatic}/layuiadmin/layui/css/layui.css" media="all">
</head>
	
<body>
<div class="layui-form" lay-filter="layuiadmin-form-admin" id="layuiadmin-form-admin" style="padding: 20px 30px 0 0;">
	<input type="hidden" name="id" value="${zx_data.id}" />
	<div class="layui-form-item">
		<label class="layui-form-label">用户名</label>
		<div class="layui-input-block">
		<input type="text" name="uname" value="${zx_data.uname}" lay-verify="uname" placeholder="请输入用户名" class="layui-input">
		</div>
	</div>
	
	<div class="layui-form-item">
		<label class="layui-form-label">真实姓名</label>
		<div class="layui-input-block">
		<input type="text" name="tname" value="${zx_data.tname}" lay-verify="tname" placeholder="请输入真实姓名" class="layui-input">
		</div>
	</div>
	
	<div class="layui-form-item">
		<label class="layui-form-label">密码</label>
		<div class="layui-input-block">
		<input type="password" name="pwd" value="" lay-verify="pwd" placeholder="密码留空则不修改" class="layui-input">
		</div>
	</div>
	
	<div class="layui-form-item">
		<label class="layui-form-label">头像</label>
		<div class="layui-input-inline">
			<c:choose>
				<c:when test="${zx_data.face ne '' and zx_data.face ne null}">
					<div class="layui-input-inline" style="width: auto;">
						<button type="button" class="layui-btn layui-btn-primary" id="zx_upload_pic">
							<i class="layui-icon"></i>替换
						</button>
						<input class="layui-upload-file" type="file" accept="undefined" name="file">
					</div>
					<button class="layui-btn layui-btn-primary view_face_img">查看</button>
					<input type="hidden" value="${zx_data.face}" name="face" id="faceFile" />
				 </c:when>
				<c:otherwise>
					<div class="layui-input-inline" style="width: auto;">
						<button type="button" class="layui-btn layui-btn-primary" id="zx_upload_pic">
						  <i class="layui-icon"></i>上传图片
						</button><input class="layui-upload-file" type="file" accept="undefined" name="file">
						<input type="hidden" name="face" id="faceFile" class="layui-input">
					</div>
			   </c:otherwise>
			</c:choose>
			
		</div>
	</div>
	
	<div class="layui-form-item">
		<label class="layui-form-label">状态</label>
		<div class="layui-input-block">
			<select name="status" id="status">
				<option value="0">离职</option>
				<option value="1">实习</option>
				<option value="2">在职</option>
			</select>
		</div>
	</div>

	
	<div class="layui-form-item">
		<label class="layui-form-label">所属部门</label>
		<div class="layui-input-block">
		<select name="branchId" lay-search="" id="branch_id">
			<c:forEach items="${branchList}" var="vo">
			<option value="${vo.id}">${vo.name}</option>
			</c:forEach>
		</select>
		</div>
	</div>
	
	<div class="layui-form-item">
		<label class="layui-form-label">所属角色</label>
		<div class="layui-input-block">
		<select name="roleId" lay-search="" id="role_id">
			<c:forEach items="${roleList}" var="vo">
			<option value="${vo.id}">${vo.name}</option>
			</c:forEach>
		</select>
		</div>
	</div>
	
	<div class="layui-form-item">
		<label class="layui-form-label">排序</label>
		<div class="layui-input-block">
		<input type="text" name="orderBy" value="${zx_data.orderBy}" lay-verify="number" placeholder="请输入用户排序"  class="layui-input">
		</div>
	</div>
	
	
	<div class="layui-form-item layui-hide">
		<input type="button" lay-submit lay-filter="ZX_iframe_submit" id="ZX_iframe_submit" value="确认">
	</div>
</div>
	
<script src="${ctxStatic}/layuiadmin/layui/layui.js"></script>  
<script language="javascript" src="${ctxStatic}/layuiadmin/jquery.min.js"></script>
<script>
$(function(){
	$('.view_face_img').on('click',function(){
		var ts = Date.parse(new Date())/1000;
		var img = '<img style="max-width:200px" src="${zx_data.face}">';
		parent.layer.open({
			type: 1,
			title: false,
			shade: 0.6 ,
			anim: 1 ,
			content: img
		}); 
	});
});

layui.config({
	base: '${ctxStatic}/layuiadmin/' //静态资源所在路径
}).extend({
	index: 'lib/index' //主入口模块
}).use(['index', 'upload', 'form'], function(){
	var $ = layui.$,
	upload = layui.upload,
	form = layui.form;
	
	//上传身份证图片
	upload.render({
		elem: '#zx_upload_pic',
		url: '../user/uploadImage',
		size: 2048, //限制文件大小，单位 KB
		field: 'file',
		exts: 'jpg|gif|png',
		done: function(res){
			if(res.code==0){
				$("#faceFile").val(res.msg);
				layer.msg("上传成功");
			}else{
				layer.msg(res.msg);
			}
		}
	});
	
	$("#branch_id").val('${zx_data.branchId}');
	$("#role_id").val('${zx_data.roleId}');
	$("#status").val('${zx_data.status}');
	form.render();
	form.verify({
		uname: function(value, item){ 
			if(!new RegExp("^[a-zA-z0-9\u4E00-\u9FA5]*$").test(value)){
				return '用户名不能出现空格';
			}
			if(value.length<5 || value.length>20){
				return '用户名必须5到20位';
			}
		},
		tname: function(value, item){ 
			if(!new RegExp("^[a-zA-z0-9\u4E00-\u9FA5]*$").test(value)){
				return '真实姓名不能出现空格';
			}
			if(value.length<1){
				return '真实姓名必须大于等于1位';
			}
		},
		pwd: function(value, item){
			if(value!='')
			{
				if(value.length>=5&&value.length<=20){
					if(!new RegExp("^[^ ]+$").test(value)){
						return '密码不能出现空格';
					}
				}
				else
				{
					return '密码必须5到20位';
				}
			}
			
		}
	});
})
</script>
</body>
</html>