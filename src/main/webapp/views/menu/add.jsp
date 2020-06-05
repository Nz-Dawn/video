<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>菜单增加</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="${ctxStatic}/layuiadmin/layui/css/layui.css" media="all">
</head>
	
<body>
<div class="layui-form" lay-filter="layuiadmin-form-admin" id="layuiadmin-form-admin" style="padding: 20px 30px 0 0;">
	<div class="layui-form-item">
		<label class="layui-form-label">所属菜单</label>
		<div class="layui-input-block">
		<select name="pid" id="pid">
			<option value="0">顶级菜单</option>
			<!-- <{volist name="menu_list" id="vo"}> -->
			<c:forEach var="vo" items="${menuList}">
				<option value="${vo.id}">${vo.name}</option>
			</c:forEach>
				<%-- <option value="${vo.id}">${vo.name}</option> --%>
			<!-- <{/volist}> -->
		</select>
		</div>
	</div>
	
	<div class="layui-form-item">
		<label class="layui-form-label">菜单名称</label>
		<div class="layui-input-block">
		<input type="text" name="name" value="" placeholder="请输入菜单名称" class="layui-input">
		</div>
	</div>
	
	<div class="layui-form-item">
		<label class="layui-form-label">菜单样式</label>
		<div class="layui-input-block">
		<button class="layui-btn layui-btn-primary" data-type="test33">选择样式</button>
		<input type="hidden" name="img" id="img" value="" />
		</div>
	</div>
	
	<div class="layui-form-item">
		<label class="layui-form-label">地址</label>
		<div class="layui-input-block">
		<input type="text" name="url" value="" placeholder="请输入地址" class="layui-input">
		</div>
	</div>
	
	<div class="layui-form-item">
		<label class="layui-form-label">控制器名</label>
		<div class="layui-input-block">
		<input type="text" name="cname" value="" placeholder="请输入控制器名" class="layui-input">
		</div>
	</div>
	
	<div class="layui-form-item">
		<label class="layui-form-label">操作按钮</label>
		<div class="layui-input-block">
		<textarea name="role" class="layui-textarea"></textarea>
		</div>
	</div>
	
	<div class="layui-form-item">
		<label class="layui-form-label">排序</label>
		<div class="layui-input-inline" style="width: 60px;">
		<input type="text" name="morder" value="1" lay-verify="number" class="layui-input" />
		</div>
		<div class="layui-input-inline layui-form-mid layui-word-aux">越小越靠前</div>
	</div>
	
	<div class="layui-form-item layui-hide">
		<input type="button" lay-submit lay-filter="ZX_iframe_submit" id="ZX_iframe_submit" value="确认">
	</div>
</div>
<style>
.layui-icon{font-size: 14px;color: #333;font-style: normal;text-align: center;float: left;width: 20px;height: 20px;line-height: 20px;cursor: pointer;border: 1px #fff solid;}.layui-icon:hover{border: 1px #333 solid;}
</style>
<script src="${ctxStatic}/layuiadmin/layui/layui.js"></script>  
<script language="javascript" src="${ctxStatic}/layuiadmin/jquery.min.js"></script>
<script>
var index_lay;
function close_xx(str){
	$("#img").val(str);
	layer.close(index_lay);
}

layui.config({
	base: '${ctxStatic}/layuiadmin/' //静态资源所在路径
}).extend({
	index: 'lib/index' //主入口模块
}).use(['index', 'form'], function(){
	var $ = layui.$,
	form = layui.form,
	admin = layui.admin,
    element = layui.element,
    layer = layui.layer;
	
	var active = {
		test33: function(){
			index_lay = layer.open({
			  type: 1,
			  title: false,
			  closeBtn: 1,
			  shadeClose: true,
			  content: '<div style="padding: 20px; width: 270px; height: 150px;"><i onclick="close_xx(\'set-fill\')" class="layui-icon layui-icon-set-fill"></i><i onclick="close_xx(\'search\')" class="layui-icon layui-icon-search"></i><i onclick="close_xx(\'share\')" class="layui-icon layui-icon-share"></i><i onclick="close_xx(\'set-sm\')" class="layui-icon layui-icon-set-sm"></i><i onclick="close_xx(\'engine\')" class="layui-icon layui-icon-engine"></i><i onclick="close_xx(\'chart-screen\')" class="layui-icon layui-icon-chart-screen"></i><i onclick="close_xx(\'star\')" class="layui-icon layui-icon-star"></i><i onclick="close_xx(\'release\')" class="layui-icon layui-icon-release"></i><i onclick="close_xx(\'list\')" class="layui-icon layui-icon-list"></i><i onclick="close_xx(\'chart\')" class="layui-icon layui-icon-chart"></i><i onclick="close_xx(\'layim-theme\')" class="layui-icon layui-icon-layim-theme"></i><i onclick="close_xx(\'table\')" class="layui-icon layui-icon-table"></i><i onclick="close_xx(\'survey\')" class="layui-icon layui-icon-survey"></i><i onclick="close_xx(\'templeate-1\')" class="layui-icon layui-icon-templeate-1"></i><i onclick="close_xx(\'util\')" class="layui-icon layui-icon-util"></i><i onclick="close_xx(\'edit\')" class="layui-icon layui-icon-edit"></i><i onclick="close_xx(\'speaker\')" class="layui-icon layui-icon-speaker"></i><i onclick="close_xx(\'file\')" class="layui-icon layui-icon-file"></i><i onclick="close_xx(\'layouts\')" class="layui-icon layui-icon-layouts"></i><i onclick="close_xx(\'rate-half\')" class="layui-icon layui-icon-rate-half"></i><i onclick="close_xx(\'read\')" class="layui-icon layui-icon-read"></i><i onclick="close_xx(\'carousel\')" class="layui-icon layui-icon-carousel"></i><i onclick="close_xx(\'code-circle\')" class="layui-icon layui-icon-code-circle"></i><i onclick="close_xx(\'water\')" class="layui-icon layui-icon-water"></i><i onclick="close_xx(\'username\')" class="layui-icon layui-icon-username"></i><i onclick="close_xx(\'location\')" class="layui-icon layui-icon-location"></i><i onclick="close_xx(\'date\')" class="layui-icon layui-icon-date"></i><i onclick="close_xx(\'layim-uploadfile\')" class="layui-icon layui-icon-layim-uploadfile"></i><i onclick="close_xx(\'delete\')" class="layui-icon layui-icon-delete"></i><i onclick="close_xx(\'friends\')" class="layui-icon layui-icon-friends"></i><i onclick="close_xx(\'layer\')" class="layui-icon layui-icon-layer"></i><i onclick="close_xx(\'dollar\')" class="layui-icon layui-icon-dollar"></i><i onclick="close_xx(\'group\')" class="layui-icon layui-icon-group"></i><i onclick="close_xx(\'layim-download\')" class="layui-icon layui-icon-layim-download"></i><i onclick="close_xx(\'picture-fine\')" class="layui-icon layui-icon-picture-fine"></i><i onclick="close_xx(\'link\')" class="layui-icon layui-icon-link"></i><i onclick="close_xx(\'diamond\')" class="layui-icon layui-icon-diamond"></i><i onclick="close_xx(\'log\')" class="layui-icon layui-icon-log"></i><i onclick="close_xx(\'rate-solid\')" class="layui-icon layui-icon-rate-solid"></i><i onclick="close_xx(\'upload\')" class="layui-icon layui-icon-upload"></i><i onclick="close_xx(\'dialogue\')" class="layui-icon layui-icon-dialogue"></i><i onclick="close_xx(\'video\')" class="layui-icon layui-icon-video"></i><i onclick="close_xx(\'cellphone-fine\')" class="layui-icon layui-icon-cellphone-fine"></i><i onclick="close_xx(\'face-smile-b\')" class="layui-icon layui-icon-face-smile-b"></i><i onclick="close_xx(\'form\')" class="layui-icon layui-icon-form"></i><i onclick="close_xx(\'cart\')" class="layui-icon layui-icon-cart"></i><i onclick="close_xx(\'camera-fill\')" class="layui-icon layui-icon-camera-fill"></i><i onclick="close_xx(\'tabs\')" class="layui-icon layui-icon-tabs"></i><i onclick="close_xx(\'fonts-code\')" class="layui-icon layui-icon-fonts-code"></i><i onclick="close_xx(\'fire\')" class="layui-icon layui-icon-fire"></i><i onclick="close_xx(\'set\')" class="layui-icon layui-icon-set"></i><i onclick="close_xx(\'picture\')" class="layui-icon layui-icon-picture"></i><i onclick="close_xx(\'flag\')" class="layui-icon layui-icon-flag"></i><i onclick="close_xx(\'rmb\')" class="layui-icon layui-icon-rmb"></i><i onclick="close_xx(\'home\')" class="layui-icon layui-icon-home"></i><i onclick="close_xx(\'user\')" class="layui-icon layui-icon-user"></i><i onclick="close_xx(\'notice\')" class="layui-icon layui-icon-notice"></i><i onclick="close_xx(\'upload-drag\')" class="layui-icon layui-icon-upload-drag"></i><i onclick="close_xx(\'snowflake\')" class="layui-icon layui-icon-snowflake"></i><i onclick="close_xx(\'file-b\')" class="layui-icon layui-icon-file-b"></i><i onclick="close_xx(\'template\')" class="layui-icon layui-icon-template"></i><i onclick="close_xx(\'auz\')" class="layui-icon layui-icon-auz"></i><i onclick="close_xx(\'console\')" class="layui-icon layui-icon-console"></i><i onclick="close_xx(\'app\')" class="layui-icon layui-icon-app"></i><i onclick="close_xx(\'website\')" class="layui-icon layui-icon-website"></i><i onclick="close_xx(\'component\')" class="layui-icon layui-icon-component"></i><i onclick="close_xx(\'camera\')" class="layui-icon layui-icon-camera"></i><i onclick="close_xx(\'note\')" class="layui-icon layui-icon-note"></i><i onclick="close_xx(\'password\')" class="layui-icon layui-icon-password"></i><i onclick="close_xx(\'theme\')" class="layui-icon layui-icon-theme"></i><i onclick="close_xx(\'tread\')" class="layui-icon layui-icon-tread"></i><i onclick="close_xx(\'praise\')" class="layui-icon layui-icon-praise"></i><i onclick="close_xx(\'rate\')" class="layui-icon layui-icon-rate"></i><i onclick="close_xx(\'vercode\')" class="layui-icon layui-icon-vercode"></i><i onclick="close_xx(\'cellphone\')" class="layui-icon layui-icon-cellphone"></i><i onclick="close_xx(\'cols\')" class="layui-icon layui-icon-cols"></i><i onclick="close_xx(\'export\')" class="layui-icon layui-icon-export"></i><i onclick="close_xx(\'print\')" class="layui-icon layui-icon-print"></i><i onclick="close_xx(\'slider\')" class="layui-icon layui-icon-slider"></i></div>'
			});
		}
	}
		
		
    $('.layui-form .layui-btn').on('click', function(){
		var type = $(this).data('type');
		active[type] && active[type].call(this);
    });

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