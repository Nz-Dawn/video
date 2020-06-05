<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../include/taglib.jsp"%>
<%@ include file="../include/upload2.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>附件上传公共页面</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<script type="text/javascript" charset="utf-8" src="${ctxStatic}/layuiadmin/ueditor/ueditor.config.js"></script>
	<script type="text/javascript" charset="utf-8" src="${ctxStatic}/layuiadmin/ueditor/ueditor.all.min.js"> </script>
	<link rel="stylesheet" href="${ctxStatic}/layuiadmin/layui/css/layui.css" media="all">
	<link rel="stylesheet" href="${ctxStatic}/layuiadmin/style/admin.css" media="all">
	<link rel="stylesheet" href="${ctxStatic}/layuiadmin/style/eleTree.css" media="all">
<style type="text/css">
td, th {height:32px;width:1%;}
table thead, tbody tr {
    display:table;
    width:99%;
    table-layout:fixed;
}

table thead {
    width: calc( 100% - 1em )
}
</style>
</head>

<body>
<script type="text/javascript">
var objectId = '${objectId}';
var tableName = '${tableName}'; 
var canEdit = '${canEdit}';
</script>
<div class="layui-form" lay-filter="layuiadmin-form-admin" id="layuiadmin-form-admin" style="padding: 10px 30px 0 0;">
	  <p class="btn-edit mb20">
	  <c:if test="${canEdit ne false}">
	  	<input type="file" name="file" id="fileToUpload" title="请选择要上传的文件" onchange="fSubmit0();">
	  </c:if>
	  </p>
	 <table class="t15 layui-table" style="overflow-y: auto; ">
	 <tbody id="tab2" style="text-align:center;overflow-y:auto;height:160px;display:block;font-size: 14px;">
		    	<tr class="ly_table_t">
			    	<td align="center" width="20%">附件名称</td>
					<td align="center" width="10%">附件大小(KB) </td>
					<td align="center" width="10%">状态 </td>
					<td align="center" width="8%">添加时间</td>
					<td align="center" width="10%">操作</td>
		    	</tr>
	    	<c:forEach items="${pmFiles }" var="pmFile" varStatus="status">
	    	<tr class="ly_table_t" id="tr${status.index }">
	    		<td align="center" style="word-wrap:break-word;" >${pmFile.fileName }</td>
	    		<td align="center">${pmFile.fileSize }</td>
	    		<td align="center">已上传</td>
	    		<td align="center">${pmFile.addTime }</td>
	    		<td align="center">
	    		<c:if test="${canEdit ne false}">
	    			<a class="layui-btn layui-btn-danger layui-btn-xs" href="javascript:void(0);" onclick="deleteFile('${pmFile.id}','${status.index }','${pmFile.filePath}')">删除</a>
	    		</c:if>
	    			<a class="layui-btn layui-btn-xs" href="../file/download.do?filename=${pmFile.filePath}" onclick="">下载</a></td>
	    	</tr>
	    	</c:forEach>
	    </tbody>
	</table>
</div>
	
<script src="${ctxStatic}/layuiadmin/layui/layui.js"></script>  
<script type="text/javascript" src="${ctxStatic}/layuiadmin/layui/layui.js"></script>
 
<script type="text/javascript">
layui.config({
	base: '${ctxStatic}/layuiadmin/' //静态资源所在路径
}).extend({
	index: 'lib/index' //主入口模块
}).use(['index','laydate', 'form','upload'], function(){
	var $ = layui.$,
	form = layui.form; 
	upload = layui.upload;
});
var index=${pmFileSize};
var objectId = ${objectId};
var tableName = '${tableName}';
var fileUploadArray=new Array();
function fSubmit0()
{
	var attr = "";
	attr +='<tr id="tr'+index+'">'
	 attr +='<td align="center" style="word-wrap:break-word;"><input type="hidden" id="uploadPath'+index+'"><div class="info" id="fileName'+index+'" ></div></td>'
	 attr +='<td align="center"><div class="info" id="fileSize'+index+'"></div></td>'
	 attr +='<td align="center"><h1><a href="#" class="fr" id="cancel'+index+'">上传中...</a></h1>'
	 +'<div class="process clearfix" id="process'+index+'"><span class="progress-box"><span class="progress-bar" style="width: 0%;" id="progress_bar'+index+'"></span></span>'
	 +'<span id="progress_percent'+index+'">0%</span></div>'
	 +'<div class="info" id="info'+index+'">已上传：<span id="has_upload'+index+'">0</span>MB  速度：<span id="upload_speed'+index+'">0</span>KB/s</div>'
	 +'<div class="info" id="success_info'+index+'" style="display: none;"></div>'
	 +'</td>'
	 attr +='<td align="center"><div class="info" id="addTime'+index+'"></td>'
	 attr +='<td align="center"><a class="layui-btn layui-btn-danger layui-btn-xs demo-delete" href="javascript:void(0);" >删除</a></td>'
	 attr +='</tr>'
     /* attr +='<tr id="tr'+index+'">'
	 attr +='<td align="center">'
	 attr +='<div class="br"  style="display:none;" id="progress_all'+index+'"><ul><li><h1><a href="#" class="fr" id="cancel'+index+'">上传中...</a></h1>'
	 attr +='<div class="process clearfix" id="process'+index+'"><span class="progress-box">'
	 attr +='<span class="progress-bar" style="width: 0%;" id="progress_bar'+index+'"></span></span>'
	 attr +='<span id="progress_percent'+index+'">0%</span></div>'
	 attr +='<div class="info" id="info'+index+'">已上传：<span id="has_upload'+index+'">0</span>MB  速度：<span id="upload_speed'+index+'">0</span>KB/s</div>'
	 attr +='<div class="info" id="success_info'+index+'" style="display: none;"></div>'
	 attr +='<button id="success_info'+index+'" class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>'
	 attr +='</li></ul>'
	 attr +='</div>'
	 attr +='</td>'
	 attr +='</tr>' */
	$("#tab2").append(attr);
	 var tr = $('#tr'+index);
	 tr.find('.demo-delete').on('click', function(){
		 var trId = tr.attr("id");
		 var teIndex = trId.replace('tr','');
         tr.remove();
         var filePath = fileUploadArray[teIndex].split('||')[0];
         $.ajax({
     		type: "GET",
     		url: '../file/deletePmFile.do',
     		dataType: "json",
     		data: {
     		      "filePath" : filePath
     	    },
     		success: function(data){
     			if(data.code==0){
     				layer.msg(data.msg);
     			}else{
     				layer.msg(data.msg);
     			}
     		}
     	});
         fileUploadArray[teIndex]='';
       	//给父页面的数组赋值《添加页面需要》
         setParentArray();
       });
    fSubmit(index);
    index++;
}
//当页面存在objectId时直接新增数据库操作
function addObject(data)
{
	//给父页面的数组赋值《添加页面需要》
	setParentArray();
	//处理字符串
	var datas=data.split('||');
	var filePath = datas[0];
	var fileSize = datas[1];
	var fileName = datas[2];
	var json = [];
	if(objectId>0 && tableName!='')
	{
		var row1 = {};
		row1.filePath = filePath;
		row1.fileSize = fileSize;
		row1.fileName = fileName;
		row1.objectId = objectId;
		row1.tableName = tableName;
		var jsonStr = JSON.stringify(row1);
		//调用数据库方法更新数据库《新增》
		$.ajax({
			type: "POST",
			url: '../file/addPmFile.do',
			dataType: "json",
			data: {data:jsonStr},
			success: function(data){
				if(data.code==0){
					location.reload();
					layer.msg(data.msg);
				}else{
					layer.msg(data.msg);
				}
			}
		});
	}
}

//当页面存在objectId时直接新增数据库操作
function deleteFile(id,index,filePath)
{
	//调用数据库删除
	$.ajax({
		type: "GET",
		url: '../file/deletePmFile.do',
		dataType: "json",
		data: {
		      "id" : id,
		      "filePath":filePath
	    },
		success: function(data){
			if(data.code==0){
				var tr = $('#tr'+index);
				tr.remove();
				layer.msg(data.msg);
			}else{
				layer.msg(data.msg);
			}
		}
	});
}

//给父页面的数组赋值《添加页面需要》,
function setParentArray()
{
	//去空值
	parent.fileUploadArray = fileUploadArray.filter(function (s) {
		   return s && s.trim();
	});
}
</script>
</body>
</html>