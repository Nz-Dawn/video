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
<c:set var="oper_add" value="USERzxAdd"/>
<c:set var="oper_edit" value="USERzxEdit"/>
<c:set var="oper_del" value="USERzxDel"/>

<div class="layui-fluid">   
	<div class="layui-card">
	<form action="" id="searchForm">
		<div class="layui-form layui-card-header layuiadmin-card-header-auto">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-block">
					<input type="text" name="unameTemp" placeholder="请输入" autocomplete="off" class="layui-input">
					</div>
				</div>
								
				<div class="layui-inline">
					<label class="layui-form-label">所属部门</label>
					<div class="layui-input-block">
				       <select name="branchId" id="branchId">
				      	<option value="">请选择</option>
				      	<c:forEach items="${keyList}" var="branch">
			      			<option value="${branch.key}">${branch.value}</option>
				      	</c:forEach>
				      </select>
				      
				      </div>
				 </div>
				 
				<div class="layui-inline">
					<label class="layui-form-label">所属角色</label>
					<div class="layui-input-block">
					       <select name="roleId" id="roleId">
					      	<option value="">请选择</option>
					      	<c:forEach items="${roleList}" var="role">
				      			<option value="${role.id}">${role.name}</option>
					      	</c:forEach>
					      </select>
				      </div>
				 </div>
				 
				<div class="layui-inline">
					<button type="button" class="layui-btn layuiadmin-btn-admin" lay-submit lay-filter="ZX_search_btn">
					<i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
					</button>
				</div>
			</div>
		</div>
	</form>
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
<shiro:hasPermission name="${oper_edit}">
	<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
	<a class="layui-btn layui-btn-xs" lay-event="role">用户权限</a>
</shiro:hasPermission>

<shiro:hasPermission name="${oper_del}">
	<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</shiro:hasPermission>
</script>


<script type="text/html" id="unameTpl">
<%--{{#  if(d.face!='' && d.face!=null){ }}
	<img src="{{ d.face}}" width="30" height="30" onerror="javascript:this.src='//t.cn/RCzsdCq'"/>{{d.uname}}
{{#  }else{ }}--%>
<i class="layui-icon layui-icon-user"></i>
<cite>{{d.uname}}</cite>
<%--{{#  }}}--%>
</script>

<script type="text/html" id="statusTpl">
{{#  if(d.status=="0"){ }}
离职
{{#  } else if(d.status=="1"){ }}
实习
{{#  } else if(d.status=="2"){ }}
在职
{{#  } }}
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
		url: '../user/getList', 
		page: true,
		cols: [[
			{checkbox: true, fixed:true},
			{field:'id', title:'ID', align:'center', width:80, sort:true},
			{field:'uname',  templet: '#unameTpl', title:'用户名', width:200,sort:true},
			{field:'tname', title:'真实姓名', align:'center', width:200},
			{field:'status', templet: '#statusTpl', title:'状态', align:'center', width:90},
			{field:'branchName', title:'所属部门',align:'center', width:200}, 
			{field:'roleName', title:'所属角色', align:'center', width:200},
			{field:'orderBy', title:'排序', align:'center', width:100},
			{title:'操作', align:'center', fixed:'right', width:220, toolbar:'#barZX'}
		]]
	});
	
	//搜索
	form.on('submit(ZX_search_btn)', function(data){
		var field = data.field;

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
			title: '添加用户',
			content: '../user/goAdd',
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
						url: '../user/insert',
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
				url: '../user/delete?id='+ids.toString(),
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
					url: '../user/delete?id='+obj.data.id,
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
		}else if(layEvent === 'role'){
			//弹出并修改
			layer.open({
				type: 2,
				title: '用户权限',
				content: '../user/goRole?id='+obj.data.id,
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
							url: '../user/updateRole',
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
		} else if(layEvent === 'edit'){
			//弹出并修改
			layer.open({
				type: 2,
				title: '修改用户',
				content: '../user/goEdit?id='+obj.data.id,
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
							url: '../user/update',
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

