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
<div class="layui-form" lay-filter="layuiadmin-form-admin" id="layuiadmin-form-admin">
	<input type="hidden" value="${zx_data.id }" name="id" />
	<input type="hidden" value="" name="tids" id="tids" />
	<table cellpadding="6" border="0" class="layui-table" widht="100%" style="margin-top: 0">
		<tr>
			<th width="100">当前用户</th>
			<td>${zx_data.tname}</td>
		</tr>
		<tr>
			<th>可管理人</th>
			<td>
				<c:forEach items="${branchUserList}" var="branch">
				<div class="branch_list">
					<div>${branch.levelName }</div>
				</div>
				<div class="userList">
				<c:forEach items="${branch.userList}" var="user">
				<div style="padding-left:${branch.level*20 + 20}px">
					
					<c:set var="nowUid" value="${user.id}"/>
					<c:set var="hasRoleUid" value="${role_uid_str}"/>
					
					<input type="checkbox" lay-skin="primary" <c:if test="${m:arrayone(nowUid,hasRoleUid,',')}"> checked="checked" </c:if> name="tid_checkbox" value="${user.id }" title="${user.tname }">
				</div>
				</c:forEach>
				</div>
			</c:forEach>
			</td>
		</tr>
	</table>
	
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
		var tid_str="";
		$("#tids").val("");
		$("input:checkbox[name='tid_checkbox']:checked").each(function() {
		    tid_str +=  $(this).val() +',';
		});
		$("#tids").val(tid_str);
	})
})
</script>
</body>
</html>