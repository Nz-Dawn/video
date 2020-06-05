<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>没有数据</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" href="${ctxStatic}/layuiadmin/layui/css/layui.css" media="all">
  <link rel="stylesheet" href="${ctxStatic}/layuiadmin/style/admin.css" media="all">
</head>
<body>


<div class="layui-fluid">
  <div class="layadmin-tips">
    <div class="layui-text">
      <h1>
        <span class="layui-anim layui-anim-loop layui-anim-">无</span> 
        <span class="layui-anim layui-anim-loop layui-anim-">此</span> 
        <span class="layui-anim layui-anim-loop layui-anim-">数</span> 
        <span class="layui-anim layui-anim-loop layui-anim-">据</span>
      </h1>
    </div>
  </div>
</div>

  <script src="${ctxStatic}/layuiadmin/layui/layui.js"></script>  
  <script>
  layui.config({
    base: '${ctxStatic}/layuiadmin/' //静态资源所在路径
  }).extend({
    index: 'lib/index' //主入口模块
  }).use(['index']);
  </script>
</body>
</html>