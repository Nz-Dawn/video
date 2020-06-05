<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>layuiAdmin 后台管理员</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="${ctxStatic}/layuiadmin/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${ctxStatic}/layuiadmin/style/admin.css" media="all">
</head>

<body>
<c:set var="oper_del" value="LOGzxDel"/> 
<div class="layui-fluid">   
	<div class="layui-card">
		<div class="layui-form layui-card-header layuiadmin-card-header-auto">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">关键字</label>
					<div class="layui-input-block">
					<input type="text" name="content" placeholder="请输入" autocomplete="off" class="layui-input">
					</div>
				</div>
				
				<div class="layui-inline">
					<button class="layui-btn layuiadmin-btn-admin" lay-submit lay-filter="ZX_search_btn">
					<i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
					</button>
				</div>
			</div>
		</div>

		<div class="layui-card-body">
			<div style="padding-bottom: 10px;">
				<shiro:hasPermission name="${oper_del}">
					<button class="layui-btn layui-btn-danger allDel">删除</button>
				</shiro:hasPermission>
			</div>

			<table id="ZX_table_list" lay-filter="ZX_table_list"></table>
		</div>
	</div>
</div>
<script src="${ctxStatic}/layuiadmin/layui/layui.js"></script>

<!-- 绑定按钮 -->
<script type="text/html" id="barZX">
<shiro:hasPermission name="${oper_del}">
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</shiro:hasPermission>
</script>

<script language="javascript">
layui.config({
	base: '${ctxStatic}/layuiadmin/'
}).extend({
	index: 'lib/index'
}).use(['index', 'table'], function(){
	var $ = layui.$,
	form = layui.form,
	table = layui.table;
	
	//初始化表格
	table.render({
		elem: '#ZX_table_list',
		height: 'full-180',
		url: '../user/getLogList',
		page: true,
		cols: [[
			{checkbox: true, fixed:true},
			{field:'id', title:'ID', align:'center', width:80,sort:true},
			/* {field:'uname', title:'登录名', width:200}, */
			{field:'tname', title:'姓名', align:'center' ,width:150},
			{field:'content', title:'内容', align:'left'},
			{field:'addTime', title:'操作时间',width:200,algin:'center'}, 
			{title:'操作', align:'center', fixed:'right', width:80,toolbar:'#barZX'}
		]]
	});
	
	//搜索
	form.on('submit(ZX_search_btn)', function(data){
		var field = data.field;
		console.log(field);

		//执行重载
		table.reload('ZX_table_list', {
			page:1,//查询时 默认定位到第一页
			where: field
		});
		$('.layui-table-tips').hide();
	});
	
	
	//批量删除
	$(".allDel").click(function(){	
		var checkStatus = table.checkStatus('ZX_table_list'),
		checkData = checkStatus.data, //得到选中的数据
		ids = [];

		if(checkData.length===0){ return layer.msg('请选择要删除的数据');}
		
		for(var i in checkData){ ids.push(checkData[i]['id']); }

		layui.layer.confirm('您真的删除么', function(index){
			layui.layer.close(index);
			$.ajax({
				type: "GET",
				url: '../user/deleteLog?id='+ids.toString(),
				dataType: "json",
				success: function(data){
					layer.msg(data.msg);
					if(data.code==0){
						table.reload('ZX_table_list');
						layer.close(index);
					}
				}
			});			
		});
	});
	
	//监听工具条
	table.on('tool(ZX_table_list)', function(obj){
		var data = obj.data,
		layEvent = obj.event;
		
		if(layEvent === 'del'){
			//删除操作
			layer.confirm('真的删除行么', function(index){
				$.ajax({
					type: "GET",
					url: '../user/deleteLog?id='+obj.data.id,
					dataType: "json",
					success: function(data){
						if(data.code==0){
							layer.msg(data.msg);
							table.reload('ZX_table_list');
							layer.close(index);
						}else{
							layer.msg(data.msg);
						}
					}
				});
			});
		}
	});
});
</script>
</body>
</html>

