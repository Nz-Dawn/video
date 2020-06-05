<%--
  Created by IntelliJ IDEA.
  User: Dawn
  Date: 2020/3/31
  Time: 18:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/taglib.jsp"%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html><%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="${ctxStatic}/layuiadmin/layui/css/layui.css" media="all">
    <script src="${ctxStatic}/layuiadmin/layui/layui.js"></script>
    <script src="${ctxStatic}/layuiadmin/jquery.min.js"></script>
</head>

<body>
<div class="kit-doc">
</div>
<!--这里写页面的代码-->
<div id="box">
    <video id="video" controls preload="auto" width="600px" height="450px">
        <source src="${ctxStatic}${kitG}" type="video/mp4">
<%--        <source src="${ctxStatic}/upload/video/20200402/20200402201034_940.mp4" type="video/mp4">--%>
    </video>
</div>


</div>

<script>
    layer.open({
        type: 1,
        title: false,
        shadeClose: true,
        area: ['600px', '500px'],
        content: $('#box'),
        success: function(layero){
            //layer样式layer-anim导致全屏样式错乱，移除该样式即可
            setTimeout(function() {
                $(layero).removeClass('layer-anim');
            }, 0);
        }
    });
</script>

</body>

</html>
