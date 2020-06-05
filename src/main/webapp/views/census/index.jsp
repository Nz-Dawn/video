<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>统计</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href="${ctxStatic}/layuiadmin/layui/css/layui.css" media="all">
	<link rel="stylesheet" href="${ctxStatic}/layuiadmin/style/admin.css" media="all">
</head>
<body>
<div class="index_conts b100">
	<div class="mang_nav">
	</div>
</div>
<div id="container" style="min-width:400px;height:400px"></div>

<div class="layui-footer">
	<fieldset class="layui-elem-field layui-field-title" >
		<legend>springboot-auth @相关信息</legend>
	</fieldset>
	<div style="float: right">
		<div class="layui-form-item">
			<div class="layui-input-inline" style="width: 100px;">
				<a href="https://gitee.com/zhumaochao/springboot-auth"  title="作者码云项目"  target="_blank" >
					<img src="https://gitee.com/logo-black.svg?20171024" height="18" width="95">
				</a>
			</div>
			<div class="layui-input-inline" style="width: 100px;">
				<a  href="https://my.oschina.net/u/3204029"  title="作者博客"  target="_blank" >
					 <i class="layui-icon layui-icon-login-weibo">其他博文</i>

				</a>
			</div>
			<div class="layui-input-inline" style="width: 100px;">
				<a href="tencent://message/?uin=779151952&Site=Sambow&Menu=yes" title="作者QQ">
					<i class="layui-icon layui-icon-login-qq">联系QQ</i>
				</a>
			</div>
			<div class="layui-input-inline" style="width: 100px;">
				<a target="_blank" href="http://mail.qq.com/cgi-bin/qm_share?t=qm_mailme&email=PgkHCgsOBgYNCH5PTxBdUVM" style="text-decoration:none;"><img src="http://rescdn.qqmail.com/zh_CN/htmledition/images/function/qm_open/ico_mailme_11.png"/></a>
			</div>
		</div>
	</div>
</div>
<!--统计-->
<script type="text/javascript" src="${ctxStatic}/public/js/highcharts.js"></script>
<script>
	/**
	 * 系统图表画图、后台传值到页面就可以了
	 */
 Highcharts.chart('container', {
		 title: {
			 text: '统计图表示例'
		 },
		xAxis: {
			categories: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
		},
		series: [{
			name:'用户访问率',
			data: [29.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]
		}, {
			name:'角色登录率',
			data: [144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4, 29.9, 71.5, 106.4, 129.2]
		},{
			name:'部门执行率',
			data: [114.0, 116.0, 115.6, 118.5, 116.4, 124.1, 195.6, 154.4, 129.9, 111.5, 206.4, 19.2]
		}
		]
	});
</script>

</body>
</html>
