<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<title>菜单管理</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" href="${ctxStatic}/layuiadmin/layui/css/layui.css" media="all">
<link rel="stylesheet" href="${ctxStatic}/layuiadmin/style/admin.css" media="all">
</head>
<body>
<!-- <{php}>$oper_add='MENUzxAdd';$oper_edit='MENUzxEdit';$oper_del='MENUzxDel';<{/php}> -->
<c:set var="oper_add" value="MENUzxAdd"/> 
<c:set var="oper_edit" value="MENUzxEdit"/> 
<c:set var="oper_del" value="MENUzxDel"/> 
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

<!-- 绑定模板 -->
<script type="text/html" id="nameTpl">
 {{#  if(d.count==1){ }} 
	<img src="${ctxStatic}/imgs/icon_fzk.gif" style="padding-bottom:2px;" align="absmiddle"  /> {{ d.name }}
 {{#  } else{ }}
	<img src="${ctxStatic}/imgs/icon_fsk.gif" align="absmiddle" style="padding-bottom:2px; padding-left:15px;" /> {{ d.name }}
 {{#  } }}
</script>
				
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
}).use(['index', 'table', 'treetable'], function(){
	var $ = layui.$,
	form = layui.form,
	table = layui.table,
	treetable = layui.treetable;
	
	var renderTable = function () {
		layer.load(2);
		$.get('../menu/getList', function (res) {
			treetable.render({
				treeColIndex: 2,
				treeSpid: 0,
				treeIdName: 'id',
				treePidName: 'pid',
				treeDefaultClose: false,
				treeLinkage: false,
				elem: '#ZX_table_list',
				/* height: 'full-200', */
				data: res.data,
				page: false,
				cols: [[	
					{checkbox: true,width:"5%"},
					{field:'id', title:'ID', align:'center', width:"10%"},
					{field:'name', templet: '#nameTpl', title:'菜单名称',width:"20%"},
					{field:'cname', title:'控制器名称', align:'center', width:"15%"},
					{field:'url', title:'地址', align:'center', width:"20%"},
					{field:'morder', title:'排序', align:'center', width:"10%"},
					{title:'操作', align:'center', fixed:'right', width:"20%", toolbar:'#barZX'}
				]],
				done: function () {
					layer.closeAll('loading');
				}
			});
		}, 'json');
	};

	renderTable();
	
	//添加操作
	$(".btnAdd").click(function(){
		//弹出并修改
		layer.open({
			type: 2,
			title: '添加菜单',
			content: '../menu/goAdd',
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
						url: '../menu/insert',
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
				url: '../menu/delete?id='+ids.toString(),
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
					url: '../menu/delete?id='+obj.data.id,
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
				title: '修改菜单',
				content: '../menu/goEdit?id='+obj.data.id,
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
							url: '../menu/update',
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

