<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>部门管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="${ctxStatic}/layuiadmin/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${ctxStatic}/layuiadmin/style/admin.css" media="all">
</head>

<body>
<c:set var="oper_add" value="BRANCHzxAdd"/>
<c:set var="oper_edit" value="BRANCHzxEdit"/> 
<c:set var="oper_del" value="BRANCHzxDel"/> 

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
<script language="javascript" src="${ctxStatic}/layuiadmin/jquery.min.js"></script>
<!-- 绑定按钮 -->
<script type="text/html" id="barZX"> 
<shiro:hasPermission name="${oper_edit}"> 
	<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
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
}).use(['index', 'table','treetable','upload'], function(){
	var $ = layui.$,
	form = layui.form,
	table = layui.table;
	treetable = layui.treetable;

	//初始化表格
	var renderTable = function () {
		layer.load(2);
		$.get('../branch/getList', function (res) {
			treetable.render({
				treeColIndex: 2,
				treeSpid: 0,
				treeIdName: 'id',
				treePidName: 'pid',
				treeDefaultClose: false,
				treeLinkage: false,
				elem: '#ZX_table_list',
				height: 'full-100',
				data: res.data,
				page: false,
				cols: [[
						{checkbox: true},
						{field:'id', title:'ID', align:'center', width:80, sort:true},
						{field:'name', title:'部门名称',width:200},
						{field:'uname', title:'联系人', align:'center', width:200},
						{field:'tel', title:'联系电话', align:'center', width:200}, 
						{field:'info', title:'简介'},
						{field:'morder', title:'排序', align:'center', width:100, sort:true},
						{title:'操作', align:'center', fixed:'right', width:120, toolbar:'#barZX'}
					]],
				done: function () {
					layer.closeAll('loading');
				}
			});
		}, 'json');
	};

	renderTable();
	

	
	
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
	
	//添加操作
	$(".btnAdd").click(function(){
		//弹出并修改
		layer.open({
			type: 2,
			title: '添加部门',
			content: '../branch/goAdd',
			area: ['460px', '450px'],
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
						url: '../branch/insert',
						data: data.field,
						dataType: "json",
						success: function(data){
							if(data.code==0){
								layer.msg(data.msg);
								//table.reload('ZX_table_list');
								layer.close(index);
								renderTable();
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
				url: '../branch/delete?id='+ids.toString(),
				dataType: "json",
				success: function(data){
					layer.msg(data.msg);
					if(data.code==0){
						//table.reload('ZX_table_list');
						renderTable();
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
					url: '../branch/delete?id='+obj.data.id,
					dataType: "json",
					success: function(data){
						if(data.code==0){
							layer.msg(data.msg);
							//table.reload('ZX_table_list');
							renderTable();
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
				title: '修改部门',
				content: '../branch/goEdit?id='+obj.data.id,
				area: ['460px', '450px'],
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
							url: '../branch/update',
							data: data.field,
							dataType: "json",
							success: function(data){
								if(data.code==0){
									layer.msg(data.msg);
									//table.reload('ZX_table_list');
									renderTable();
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

