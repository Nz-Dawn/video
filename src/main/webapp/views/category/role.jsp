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
<style>.sp10{width: 100%; clear: both; height: 10px;}</style>
</head>
	
<body>
<div class="layui-form" lay-filter="layuiadmin-form-admin" id="layuiadmin-form-admin" style="padding:0;">
	<input type="hidden" name="roleId" value="${zx_data.id}" />
	<input type="hidden" value="0" name="selectAllVal" id="selectAllVal" />
	<input type="hidden"   name="idsTemp" id="idsTemp" />
	<input type="hidden"   name="roleInfosTemp" id="roleInfosTemp" />
	
	<table width="100%" border="0" cellspacing="0" cellpadding="6" class="add_table layui-table" style="margin-top: 0">
		<tr>
			<th width="100">角色名称：</th><td>${zx_data.name}</td>
		</tr>
		<tr>
			<th>操　　作：</th>
			<td><input type="checkbox" lay-skin="primary" name="checkbox" lay-filter="allSelect" title="全选/全不选" /></td>
		</tr>
	</table>
	<c:forEach items="${menuList}" var="menu">
	<!-- <{volist name="menu" id="vo"}> -->
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="layui-table">
		<tr class="bgtr">
			<th colspan="2">
				<c:set var="setParentId" value="${menu.id}"/>
				<c:set var="setmenuControl" value="${zx_data.menuControl}"/>
				<c:set var="setOperControl" value="${zx_data.operControl}"/>
				<input lay-skin="primary" type="checkbox" name="ids" class="checkId y_${menu.id}" lay-filter="y" value="${menu.id}" title="${menu.name}" 
						<c:if test="${m:arrayone(setParentId,setmenuControl,',')}"> checked="checked" </c:if>/>
			</th>
		</tr>
		<tr>
			<td colspan="2" style="padding:10px;">
		 		<c:forEach items="${menu.childList}" var="child">
				<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" class="role_table">
					<tr>
						<th colspan="2">
							 <c:set var="setChildId" value="${child.id}"/>
							 <input lay-skin="primary" type="checkbox" name="ids" class="checkId y_${menu.id} e_${child.id}" lay-filter="e" value="${child.id}" title="${child.name}" 
									 <c:if test="${m:arrayone(setChildId,setmenuControl,',')}"> checked="checked" </c:if>/>
						</th>
					</tr>
					<tr>
						<td colspan="2">
					 		<c:forEach items="${child.voList}" var="roles">
						  			<c:set var="setTmp" value="${child.cname}${roles.value}"/>  
	 								<input lay-skin="primary" type="checkbox" name="roleInfos" class="checkId y_${menu.id} e_${child.id}" value="${setTmp}"  
	 										<c:if test="${m:arrayone(setTmp,setOperControl,',')}"> checked="checked" </c:if> title="${roles.key}" />
							</c:forEach>
						</td>
					</tr>
				</table>
				<div class="sp10"></div>
				 </c:forEach>
			</td>
		</tr>
	</table>
	<div class="sp10"></div>
	</c:forEach>
	
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
	
	$("#ZX_iframe_submit").click(function(){
		var ids_str="";
		$("#idsTemp").val("");
		$("input:checkbox[name='ids']:checked").each(function() {
			ids_str +=  $(this).val() +',';
		});
		$("#idsTemp").val(ids_str);
		
		
		var roleInfos_str="";
		$("#roleInfosTemp").val("");
		$("input:checkbox[name='roleInfos']:checked").each(function() {
			roleInfos_str +=  $(this).val() +',';
		});
		$("#roleInfosTemp").val(roleInfos_str);
	})
	
	//全选/全不选
	form.on('checkbox(allSelect)', function(data){
		$('.checkId').each(function(index, item){
			item.checked = data.elem.checked;
		});
		form.render('checkbox');
	});
	
	//一级选中
	form.on('checkbox(y)', function(data){
		var id=data.value;
		var ids="";
		console.log(data);
		
		$('.y_'+id).each(function(index, item){
			item.checked = data.elem.checked;
			ids = ids + "," +item.valueOf();
		});
		form.render('checkbox');
		
		$("#selectIdTemp").val(ids);
	});
	
	//二级
	form.on('checkbox(e)', function(data){
		var id=data.value;
		$('.e_'+id).each(function(index, item){
			item.checked = data.elem.checked;
		});
		form.render('checkbox');
	});
})
</script>
</body>
</html>