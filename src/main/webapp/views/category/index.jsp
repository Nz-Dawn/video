<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<title>分类管理</title>
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
					<button class="layui-btn btnAdd">添加</button>
					<button class="layui-btn layui-btn-danger allDel">删除</button>
			</div>
			<table id="ZX_table_list" lay-filter="ZX_table_list"></table>
		</div>
	</div>
</div>
<script src="${ctxStatic}/layuiadmin/layui/layui.js"></script>
<!-- 绑定按钮 -->
<script type="text/html" id="barZX">
<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
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
		url: '${ctxStatic}/sys/category/getList',
		cols: [[
			{checkbox: true, fixed:true},
			{field:'id', title:'ID', align:'center', width:80, sort:true},
			{field:'name', title:'分类名称', align:'center',width:200},
			{field:'description', title:'描述', align:'center', width:400, sort:false},
			{field:'createtime', title:'创建时间', align:'center', width:200, sort:false},
			{title:'操作', align:'center', fixed:'right', width:300, toolbar:'#barZX'}
		]]
	});
	
	//添加操作
	$(".btnAdd").click(function(){
		//弹出并修改
		layer.open({
			type: 2,
			title: '添加分类',
			content: '${ctxStatic}/sys/category/goAdd',
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
						url: '${ctxStatic}/sys/category/insert',
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
				url: '${ctxStatic}/sys/category/delete?id='+ids.toString(),
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
			layer.confirm('确定删除？', function(index){
				$.ajax({
					type: "GET",
					url: '${ctxStatic}/sys/category/delete?id='+obj.data.id,
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
				content: '${ctxStatic}/sys/category/goEdit?id='+obj.data.id,
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
							url: '${ctxStatic}/sys/category/update',
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
		}
	});
});
</script>
</body>
</html>

