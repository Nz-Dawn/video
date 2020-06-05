<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html>
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
<c:set var="oper_add" value="ROLEzxAdd"/> 
<c:set var="oper_edit" value="ROLEzxEdit"/> 
<c:set var="oper_role" value="ROLEzxRole"/> 
<c:set var="oper_del" value="ROLEzxDel"/>

<div class="layui-fluid">
	<div class="layui-card">
		<div class="layui-card-body">
			<div style="padding-bottom: 10px;">
				 <shiro:hasPermission name="${oper_add}">  
					<button class="layui-btn btnAdd">添加</button>
				  </shiro:hasPermission>  
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
 
<shiro:hasPermission name="${oper_edit}">
<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
</shiro:hasPermission>
 
<shiro:hasPermission name="${oper_role}">
<a class="layui-btn layui-btn-xs" lay-event="role" >权限设定</a>
</shiro:hasPermission>
 
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
		 height: 'full-100', 
		url: '../role/getList',
		cols: [[
			{checkbox: true, fixed:true},
			{field:'id', title:'ID', align:'center', width:80, sort:true},
			{field:'name', title:'角色名称'},
			{field:'morder', title:'排序', align:'center', width:100, sort:true},
			{title:'操作', align:'center', fixed:'right', width:300, toolbar:'#barZX'}
		]]
	});
	
	//添加操作
	$(".btnAdd").click(function(){
		//弹出并修改
		layer.open({
			type: 2,
			title: '添加角色',
			content: '../role/goAdd',
			area: ['460px', '225px'],
			btnAlign: 'c',
			btn: ['确定', '取消'],
			yes: function(index, layero){
				var iframeWindow = window['layui-layer-iframe'+ index],
				submitID = 'ZX_iframe_submit',
				submit = layero.find('iframe').contents().find('#'+ submitID);
				
				//监听提交
				iframeWindow.layui.form.on('submit('+ submitID +')', function(data){
					$.ajax({
						type: "POST",
						url: '../role/insert',
						data: data.field,
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
				submit.trigger('click');
			}
		});
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
				url: '../role/delete?id='+ids.toString(),
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
					url: '../role/delete?id='+obj.data.id,
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
		}else if(layEvent === 'edit'){
			
			//弹出并修改
			layer.open({
				type: 2,
				title: '修改角色',
				content: '../role/goEdit?id='+obj.data.id,
				area: ['460px', '225px'],
				btnAlign: 'c',
				btn: ['确定', '取消'],
				yes: function(index, layero){
					var iframeWindow = window['layui-layer-iframe'+ index],
					submitID = 'ZX_iframe_submit',
					submit = layero.find('iframe').contents().find('#'+ submitID);

					//监听提交
					iframeWindow.layui.form.on('submit('+ submitID +')', function(data){
						$.ajax({
							type: "POST",
							url: '../role/update',
							data: data.field,
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
					submit.trigger('click');
				}
			});
		}else if(layEvent === 'role'){
			
			//设定权限
			layer.open({
				type: 2,
				title: '权限设定',
				content: '../role/goRole?id='+obj.data.id,
				area: ['800px', '500px'],
				btnAlign: 'c',
				btn: ['确定', '取消'],
				yes: function(index, layero){
					var iframeWindow = window['layui-layer-iframe'+ index],
					submitID = 'ZX_iframe_submit',
					submit = layero.find('iframe').contents().find('#'+ submitID);
				    
					//监听提交
					iframeWindow.layui.form.on('submit('+ submitID +')', function(data){
					    console.log(data.filed);
						$.ajax({
							type: "POST",
							url: '../role/updateRole',
							data: data.field,
							traditional:true,
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
					submit.trigger('click');
				}
			});
		}
	});
});
</script>
</body>
</html>

