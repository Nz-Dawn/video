<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>上传视频</title>
    <link rel="stylesheet" href="${ctxStatic}/layuiadmin/layui/css/layui.css" media="all">
    <script src="${ctxStatic}/layuiadmin/layui/layui.js"></script>
    <script src="${ctxStatic}/layuiadmin/jquery.min.js"></script>
    <script type="text/javascript">
        layui.use('upload',function(){
            var $ = layui.jquery
                ,upload = layui.upload;

            upload.render({
                elem: '#fileBtn'
                ,url: '/uploadFiles/uploadImg'
                ,accept: 'file'
                ,field:"layuiFile"
                ,auto: false
                ,bindAction: '#uploadBtn'
                ,done: function(res){
                    alert(res.data.src);
                    $("[name=userImage]").val(res.data.src);
                }
            });


            //普通图片上传
            var uploadInst = upload.render({
                elem: '#test1'
                ,url: '/uploadFiles/uploadImg'
                ,field:"layuiFile"
                ,before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#demo1').attr('src', result); //图片链接（base64）
                    });
                }
                ,done: function(res){
                    //如果上传失败
                    if(res.code > 0){
                        if(res.code == 5){
                            return layer.msg('权限不够，请收藏更多视频！');
                        }
                        return layer.msg('上传失败');
                    }
                    //上传成功
                    $("[name=img1]").val(res.data.src);
                }
                ,error: function(){
                    //演示失败状态，并实现重传
                    var demoText = $('#demoText');
                    demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
                    demoText.find('.demo-reload').on('click', function(){
                        uploadInst.upload();
                    });
                }
            });

            //多图片上传
            upload.render({
                elem: '#test2'
                ,url: '/uploadFiles/uploadImg'
                ,field:"layuiFile"
                ,multiple: true
                ,before: function(obj){
                    //预读本地文件示例，不支持ie8
                    obj.preview(function(index, file, result){
                        $('#demo2').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img" style="width: 230px;height: 230px;">')
                    });
                }
                ,done: function(res){
                    //上传完毕
                }
            });

            //上传视频
            var uploadInst=upload.render({
                elem: '#video'
                ,url: '${ctxStatic}/self/center/uploadVideo'
                ,field:"layuiVideo"
                ,data:{"dir":"media"}
                ,accept: 'video' //视频
                // ,before:function (obj) {
                //     $('#demo9').css('display','block').attr('src', "http://p6nngxvb7.bkt.clouddn.com/FsyjSltTtkVtzepa_w7zsnS_S7zO"); //链接（base64）http://p6nngxvb7.bkt.clouddn.com/FsyjSltTtkVtzepa_w7zsnS_S7zO
                // }
                ,done: function(res){
                    if(res.code==1){
                        layer.alert(res.message,5);
                    }
                    if(res.error>0){
                        return layer.msg(res.message);
                    }
                    if(res.error==0){
                        //alert("res.url:"+res.url);
                        $("#videourl").val(res.url);
                        $("#url").val(res.url);
                        $("#time").val(res.time);
                        $("#demo9").attr("src",res.url);
                        layer.alert("上传成功",{offset:['200px','450px'],icon:6});
                    }
                }
                ,error:function () {
                    //演示失败状态，并实现重传
                    var demoText = $('#demoText');
                    demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                    demoText.find('.demo-reload').on('click', function () {
                        uploadInst.upload();
                    });
                }
            });
        });
    </script>

</head>
<body>
<%--<div class="layui-upload">--%>
<%--    <div class="layui-upload">--%>
<%--        <input type="hidden" name="userImage" required lay-verify="required" />--%>
<%--        <button type="button" class="layui-btn layui-btn-primary" id="fileBtn"><i class="layui-icon">&#xe67c;</i>选择文件</button>--%>
<%--        <button type="button" class="layui-btn layui-btn-warm" id="uploadBtn">开始上传</button>--%>
<%--    </div>--%>
<%--</div>--%>


<%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">--%>
<%--    <legend>常规使用：普通图片上传</legend>--%>
<%--</fieldset>--%>
<%--<div class="layui-upload">--%>
<%--    <input type="hidden" name="img1" required lay-verify="required" />--%>
<%--    <button type="button" class="layui-btn" id="test1">上传图片</button>--%>
<%--    <div class="layui-upload-list">--%>
<%--        <img class="layui-upload-img" id="demo1" style="width: 230px;height: 230px;">--%>
<%--        <p id="demoText"></p>--%>
<%--    </div>--%>
<%--</div>--%>


<%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">--%>
<%--    <legend>上传多张图片</legend>--%>
<%--</fieldset>--%>
<%--<div class="layui-upload">--%>
<%--    <button type="button" class="layui-btn" id="test2">多图片上传</button>--%>
<%--    <blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">--%>
<%--        预览图：--%>
<%--        <div class="layui-upload-list" id="demo2"></div>--%>
<%--    </blockquote>--%>
<%--</div>--%>


<%--<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">--%>
<%--    <legend>指定允许上传的文件类型</legend>--%>
<%--</fieldset>--%>
<%--<button type="button" class="layui-btn" id="test3"><i class="layui-icon"></i>上传文件</button>--%>
<%--<button type="button" class="layui-btn layui-btn-primary" id="test4"><i class="layui-icon"></i>只允许压缩文件</button>--%>
<%--<button type="button" class="layui-btn" id="test5"><i class="layui-icon"></i>上传视频</button>--%>
<%--<button type="button" class="layui-btn" id="test6"><i class="layui-icon"></i>上传音频</button>--%>


<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>上传视频</legend>
</fieldset>
<div class="layui-form-item" id="videoUp" style="margin-left: 5%;">
<%--    <label class="layui-form-label" style="height: 137px; line-height: 117px">视频</label>--%>
    <input name="classVideo" id="videourl"  value="" autocomplete="off" class="layui-input" type="hidden">
    <div class=" layui-upload-drag" id="video" style="border-left: 0px;" type="video">
        <i class="layui-icon">&#xe654;</i>
        <p>点击上传</p>
        <video id="demo9" src="" style="position: absolute;height: 137px;width: 137px;margin: -106px auto auto -60px;"/>
    </div>
    <input type="button" class="layui-btn" value="预览" onclick="openVideo()" style="margin-left: 30px">
</div>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
    <legend>填写信息</legend>
</fieldset>
<form class="layui-form" lay-filter="layuiadmin-form-admin" method="post" id="videoForm" action="${ctxStatic}/video/add" style="padding: 20px 30px 0 0;">
    <input type="hidden" name="url" id="url" value="" />
<%--    <input type="hidden" name="cover" id="cover" value="" />--%>
<%--    <input type="hidden" name="time" id="time" value="" />--%>
    <div class="layui-form-item">
        <label class="layui-form-label">选择分类</label>
        <div class="layui-input-inline layui-form-select">
            <select name="category"  id="category" lay-filter="category">
                <option value=""></option>
                <c:forEach items="${categorys}" var="vo">
                    <option value="${vo.id}">${vo.name}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">视频描述</label>
        <div class="layui-input-inline" style="width: 55%">
            <textarea name="desception" class="layui-textarea" placeholder="请添加视频描述内容"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">可下载</label>
        <div class="layui-input-inline layui-form-radio">
            <input name="iscandown" title="是" type="radio" checked value="1">
            <input name="iscandown" title="否" type="radio" value="0">
        </div>
    </div>
    <div class="layui-form-item" style="margin-left: 10%">
        <input type="submit" class="layui-btn" lay-submit lay-filter="submit" id="submit" value="保存">
    </div>
</form>
</body>
<script type="text/javascript">
    function openVideo() {

        var classVideo = document.getElementById("videourl").value;
        var index = layer.open({
            type: 2,
            content: '${ctxStatic}/self/center/goLook?classVideo='+classVideo,
            area: ['600px', '493px'],
            offset:'t',
            maxmin: true,
            end: function () {

            }
        });
    }
    layui.use('form', function(){
        var form = layui.form;
        form.render('select','category');
        //各种基于事件的操作，下面会有进一步介绍
        //form.render('组件名','lay-filter名')
    });

</script>
</html>