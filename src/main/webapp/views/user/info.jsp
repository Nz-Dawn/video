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

<body style="padding-top:20px">
<div class="layui-fluid">
	<div class="layui-row layui-col-space15">
		<div class="layui-col-md12">
			<div class="layui-card">
				<div class="layui-card-header">个人资料</div>
				<div class="layui-card-body" pad15>
					<div class="layui-form" lay-filter="">
					
	<input type="hidden" name="uId" value="${user.id }">
	<input type="hidden" name="id" value="${zx_data.id}" />
	
	<div class="layui-form-item">
		
		<label class="layui-form-label">用户</label>
		<div class="layui-input-inline" style="line-height:40px;">
		${user.tname }
		</div>
		<label class="layui-form-label">部门</label>
		<div class="layui-input-inline" style="line-height:40px;">
		${branch_data.name }
		</div>
	</div>
	
	<div class="layui-form-item">
		<label class="layui-form-label">头像</label>
		<div class="layui-input-inline">
			<c:choose>
				<c:when test="${user.face ne '' and user.face ne null}">
					<div class="layui-input-inline" style="width: auto;">
						<button type="button" class="layui-btn layui-btn-primary" id="zx_upload_face">
							<i class="layui-icon"></i>替换
						</button>
						<input class="layui-upload-file" type="file" accept="undefined" name="file">
					</div>
					<button class="layui-btn layui-btn-primary view_face_img">查看</button>
					<input type="hidden" value="${user.face}" id="faceFile" />
				 </c:when>
				<c:otherwise>
					<div class="layui-input-inline" style="width: auto;">
						<button type="button" class="layui-btn layui-btn-primary" id="zx_upload_face">
						  <i class="layui-icon"></i>上传图片
						</button>
						<input class="layui-upload-file" type="file" accept="undefined" name="file">
					</div>
			   </c:otherwise>
			</c:choose>
			
		</div>
	</div>
	
	<div class="layui-form-item">
		<label class="layui-form-label">出生日期</label>
		<div class="layui-input-inline">
		<input type="text" name="birthday" id="birthday" value="${zx_data.birthday}" class="layui-input">
		</div>
		<label class="layui-form-label">性别</label>
		<div class="layui-input-inline">
		<input type="radio" name="sex" value="0" <c:if test="${zx_data.sex=='0'}">checked</c:if> title="男" />
		<input type="radio" name="sex" value="1" <c:if test="${zx_data.sex=='1'}">checked</c:if> title="女" />
		</div>
	</div>
		
	<div class="layui-form-item">
		<label class="layui-form-label">手机号码</label>
		<div class="layui-input-inline">
		<input type="text" name="phone" value="${zx_data.phone}" class="layui-input">
		</div>
		<label class="layui-form-label">邮箱</label>
		<div class="layui-input-inline">
		<input type="text" name="email" value="${zx_data.email}" class="layui-input">
		</div>
	</div>
	
	<div class="layui-form-item">
		<label class="layui-form-label">籍贯</label>
		<div class="layui-input-inline">
		<input type="text" name="nativeplace" value="${zx_data.nativeplace}" class="layui-input">
		</div>
		<label class="layui-form-label">民族</label>
		<div class="layui-input-inline">
		<input type="text" name="nation" value="${zx_data.nation}" class="layui-input">
		</div>
	</div>
	
	<div class="layui-form-item">
		<label class="layui-form-label">血型</label>
		<div class="layui-input-inline">
		<input type="text" name="bloodtype" value="${zx_data.bloodtype}" class="layui-input">
		</div>
		<label class="layui-form-label">出生地</label>
		<div class="layui-input-inline">
		<input type="text" name="birthplace" value="${zx_data.birthplace}" class="layui-input">
		</div>
	</div>
	
	<div class="layui-form-item">
		<label class="layui-form-label">婚姻状态</label>
		<div class="layui-input-inline">
		<input type="radio" name="maritalstatus" value="0" <c:if test="${zx_data.maritalstatus=='0'}">checked</c:if> title="已婚" />
		<input type="radio" name="maritalstatus" value="1" <c:if test="${zx_data.maritalstatus=='1'}">checked</c:if> title="未婚" />
		</div>
		<label class="layui-form-label">联系地址</label>
		<div class="layui-input-inline">
		<input type="text" name="contactaddress" value="${zx_data.contactaddress}" class="layui-input">
		</div>
	</div>
	
	<div class="layui-form-item" style="margin-bottom: 180px;">
		<div class="layui-input-block">
			<button class="layui-btn" lay-submit lay-filter="set_website">确认保存</button>
		</div>
	</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script language="javascript" src="${ctxStatic}/layuiadmin/layui/layui.js"></script> 
<script language="javascript" src="${ctxStatic}/layuiadmin/jquery.min.js"></script>
<script language="javascript">
$(function(){
	$('.view_face_img').on('click',function(){
		var ts = Date.parse(new Date())/1000;
		var img_src=$("#faceFile").val();

		var img = '<img style="max-width:200px" src="'+img_src+'">';
		parent.layer.open({
			type: 1,
			title: false,
			shade: 0.6 ,
			anim: 1 ,
			content: img
		}); 
	});
});

layui.config({
	base: '${ctxStatic}/layuiadmin/'
}).extend({
	index: 'lib/index'
}).use(['index', 'set', 'form','upload', 'laydate'],function(){
	var $ = layui.$,
	laydate = layui.laydate,
	admin = layui.admin,
	upload = layui.upload,
	form = layui.form;
	
	//上传头像
	upload.render({
		elem: '#zx_upload_face',
		url: '../person/uploadImage.do?type=face',
		size: 2048, //限制文件大小，单位 KB
		field: 'file',
		exts: 'jpg|gif|png',
		done: function(res){
			if(res.code==0){
				$("#faceFile").val(res.msg);
				layer.msg("上传成功");
			}else{
				layer.msg(res.msg);
			}
		}
	});
	
	laydate.render({ elem: '#birthday', type: 'date' });
	
	form.on('submit(set_website)', function(obj){
		admin.req({
			url: '${ctxStatic}/sys/person/submit',
			method:'post',
			data: obj.field,
			done: function(res){
				if(res.code==0){
					layer.msg("修改成功！", {
						offset: 'auto',
						icon: 1,
						time: 1000
					});
					location.reload();
				}else{
					layer.msg("什么鬼？？？");
				}
			}
		});
	});

});
</script>
</body>
</html>